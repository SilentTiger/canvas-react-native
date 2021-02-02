export abstract class CanvasGradient {
  public abstract clone(): CanvasGradient
}

export class CanvasLinearGradient extends CanvasGradient {
  readonly x0: number
  readonly y0: number
  readonly x1: number
  readonly y1: number
  readonly colorStop: { offset: number; color: string }[] = []

  constructor(x0: number, y0: number, x1: number, y1: number) {
    super()
    this.x0 = x0
    this.y0 = y0
    this.x1 = x1
    this.y1 = y1
  }

  public addColorStop(offset: number, color: string) {
    this.colorStop.push({ offset, color })
  }

  public clone() {
    return new CanvasLinearGradient(this.x0, this.y0, this.x1, this.y1)
  }
}

export class CanvasRadialGradient extends CanvasGradient {
  readonly x0: number
  readonly y0: number
  readonly r0: number
  readonly x1: number
  readonly y1: number
  readonly r1: number

  constructor(x0: number, y0: number, r0: number, x1: number, y1: number, r1: number) {
    super()
    this.x0 = x0
    this.y0 = y0
    this.r0 = r0
    this.x1 = x1
    this.y1 = y1
    this.r1 = r1
  }

  public clone() {
    return new CanvasRadialGradient(this.x0, this.y0, this.r0, this.x1, this.y1, this.r1)
  }
}
