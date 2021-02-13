import { EnumMethodCommand, EnumPropertyCommand } from './Enum'

interface ICommandCacheItem {
  id: number
  cmdType: EnumMethodCommand | EnumPropertyCommand
  args: any
}

interface ICallbackCacheItem {
  cmdType: EnumMethodCommand | EnumPropertyCommand
  args: any
  cb: (result: any, id: number, cmdType: EnumMethodCommand | EnumPropertyCommand, args: any) => void
}

export default class Synchronizer {
  #synchronizeHandler: (command: string) => void
  #interval = 0
  currentId = 0
  timer: number | undefined = undefined
  cmdCache: Array<ICommandCacheItem> = []
  callbackCache: Map<number, ICallbackCacheItem> = new Map()

  constructor(syncHandler: (command: string) => void) {
    this.#synchronizeHandler = syncHandler
  }

  public setInterval(interval: number) {
    this.#interval = interval
  }

  public pushCommand(
    cmdType: EnumMethodCommand | EnumPropertyCommand,
    args: any[],
    callback?: (result: any, id: number, cmdType: EnumMethodCommand | EnumPropertyCommand, args: any) => void
  ) {
    const id = this.currentId++
    this.cmdCache.push({ id, cmdType, args })
    if (callback) {
      this.callbackCache.set(id, {
        cmdType,
        args,
        cb: callback,
      })
    }
    if (this.timer === undefined) {
      this.timer = setTimeout(() => {
        this.sync()
      }, this.#interval)
    }
  }

  public sync(async = true) {
    // sync command to native
    console.log('sync in Synchronizer', async, this.cmdCache)
    const command = JSON.stringify(this.cmdCache)
    console.log('sync in Synchronizer', command)
    this.#synchronizeHandler(command)

    this.cmdCache.length = 0
    this.timer = undefined
  }

  /**
   * remove all method command and no sense property command
   */
  public dryCommands() {
    const propertySet = new Set<EnumPropertyCommand>()
    for (let index = this.cmdCache.length - 1; index >= 0; index--) {
      const currentCmd = this.cmdCache[index]
      if (currentCmd.cmdType >= EnumMethodCommand.restore) {
        this.cmdCache.splice(index, 1)
      } else {
        if (propertySet.has(currentCmd.cmdType as EnumPropertyCommand)) {
          this.cmdCache.splice(index, 1)
        } else {
          propertySet.add(currentCmd.cmdType as EnumPropertyCommand)
        }
      }
    }
  }
}
