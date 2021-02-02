import { CanvasGradient, CanvasLinearGradient, CanvasRadialGradient } from './CanvasGradient'
import { EnumPropertyCommand, EnumCompositeOperation, EnumMethodCommand } from './Enum'
import type Synchronizer from './Synchronizer'

interface ICanvasContextProperty {
  globalAlpha: number
  globalCompositeOperation: EnumCompositeOperation
  imageSmoothingEnabled: boolean
  imageSmoothingQuality: ImageSmoothingQuality
  fillStyle: string | CanvasGradient
  strokeStyle: string | CanvasGradient
  shadowBlur: number
  shadowColor: string
  shadowOffsetX: number
  shadowOffsetY: number
  filter: string
  lineCap: CanvasLineCap
  lineDashOffset: number
  lineJoin: CanvasLineJoin
  lineWidth: number
  miterLimit: number
  direction: CanvasDirection
  font: string
  textAlign: CanvasTextAlign
  textBaseline: CanvasTextBaseline
}

export default class CanvasContext {
  #propertyStack: ICanvasContextProperty[] = []
  #lineDash: number[] = []
  #synchronizer: Synchronizer
  // #region 覆盖 CanvasRenderingContext2D 上的属性
  // public get canvas(): HTMLCanvasElement { return this.ctxDoc.canvas }
  // set canvas(val: HTMLCanvasElement) {this.ctx.canvas = val;}  // 这是一个 readonly 属性不能设置 setter

  #globalAlpha = 1
  public get globalAlpha(): number {
    return this.#globalAlpha
  }
  public set globalAlpha(val: number) {
    this.#globalAlpha = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.globalAlpha, val)
  }

  #globalCompositeOperation: EnumCompositeOperation = EnumCompositeOperation.SourceOver
  public get globalCompositeOperation(): EnumCompositeOperation {
    return this.#globalCompositeOperation
  }
  public set globalCompositeOperation(val: EnumCompositeOperation) {
    this.#globalCompositeOperation = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.globalCompositeOperation, val)
  }

  #imageSmoothingEnabled = true
  public get imageSmoothingEnabled(): boolean {
    return this.#imageSmoothingEnabled
  }
  public set imageSmoothingEnabled(val: boolean) {
    this.#imageSmoothingEnabled = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.imageSmoothingEnabled, val)
  }

  #imageSmoothingQuality: ImageSmoothingQuality = 'high'
  public get imageSmoothingQuality(): ImageSmoothingQuality {
    return this.#imageSmoothingQuality
  }
  public set imageSmoothingQuality(val: ImageSmoothingQuality) {
    this.#imageSmoothingQuality = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.imageSmoothingQuality, val)
  }

  // not support CanvasPattern
  #fillStyle: string | CanvasGradient = ''
  public get fillStyle(): string | CanvasGradient {
    return typeof this.#fillStyle === 'string' ? this.#fillStyle : this.#fillStyle.clone()
  }
  public set fillStyle(val: string | CanvasGradient) {
    if (typeof val === 'string') {
      this.#fillStyle = val
    } else {
      this.#fillStyle = val.clone()
    }
    this.#synchronizer.pushCommand(EnumPropertyCommand.fillStyle, this.#fillStyle)
  }

  // not support CanvasPattern
  #strokeStyle: string | CanvasGradient = ''
  public get strokeStyle(): string | CanvasGradient {
    return typeof this.#strokeStyle === 'string' ? this.#strokeStyle : this.#strokeStyle.clone()
  }
  public set strokeStyle(val: string | CanvasGradient) {
    if (typeof val === 'string') {
      this.#strokeStyle = val
    } else {
      this.#strokeStyle = val.clone()
    }
    this.#synchronizer.pushCommand(EnumPropertyCommand.strokeStyle, this.#strokeStyle)
  }

  #shadowBlur = 0
  public get shadowBlur(): number {
    return this.#shadowBlur
  }

  public set shadowBlur(val: number) {
    this.#shadowBlur = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.shadowBlur, val)
  }

  #shadowColor = 'fully-transparent'
  public get shadowColor(): string {
    return this.#shadowColor
  }

  public set shadowColor(val: string) {
    this.#shadowColor = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.shadowColor, val)
  }

  #shadowOffsetX = 0
  public get shadowOffsetX(): number {
    return this.#shadowOffsetX
  }

  public set shadowOffsetX(val: number) {
    this.#shadowOffsetX = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.shadowOffsetX, val)
  }

  #shadowOffsetY = 0
  public get shadowOffsetY(): number {
    return this.#shadowOffsetY
  }

  public set shadowOffsetY(val: number) {
    this.#shadowOffsetY = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.shadowOffsetY, val)
  }

  #filter = 'none'
  public get filter(): string {
    return this.#filter
  }

  public set filter(val: string) {
    this.#filter = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.filter, val)
  }

  #lineCap: CanvasLineCap = 'butt'
  public get lineCap(): CanvasLineCap {
    return this.#lineCap
  }
  public set lineCap(val: CanvasLineCap) {
    this.#lineCap = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.lineCap, val)
  }

  #lineDashOffset = 0
  public get lineDashOffset(): number {
    return this.#lineDashOffset
  }
  public set lineDashOffset(val: number) {
    this.#lineDashOffset = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.lineDashOffset, val)
  }

  #lineJoin: CanvasLineJoin = 'miter'
  public get lineJoin(): CanvasLineJoin {
    return this.#lineJoin
  }
  public set lineJoin(val: CanvasLineJoin) {
    this.#lineJoin = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.lineJoin, val)
  }

  #lineWidth = 1
  public get lineWidth(): number {
    return this.#lineWidth
  }
  public set lineWidth(val: number) {
    this.#lineWidth = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.lineWidth, val)
  }

  #miterLimit = 10
  public get miterLimit(): number {
    return this.#miterLimit
  }
  public set miterLimit(val: number) {
    this.#miterLimit = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.miterLimit, val)
  }

  #direction: CanvasDirection = 'ltr'
  public get direction(): CanvasDirection {
    return this.#direction
  }
  public set direction(val: CanvasDirection) {
    this.#direction = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.direction, val)
  }

  #font = '10px sans-serif'
  public get font(): string {
    return this.#font
  }
  public set font(val: string) {
    this.#font = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.font, val)
  }

  #textAlign: CanvasTextAlign = 'start'
  public get textAlign(): CanvasTextAlign {
    return this.#textAlign
  }
  public set textAlign(val: CanvasTextAlign) {
    this.#textAlign = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.textAlign, val)
  }

  #textBaseline: CanvasTextBaseline = 'alphabetic'
  public get textBaseline(): CanvasTextBaseline {
    return this.#textBaseline
  }
  public set textBaseline(val: CanvasTextBaseline) {
    this.#textBaseline = val
    this.#synchronizer.pushCommand(EnumPropertyCommand.textBaseline, val)
  }
  // #endregion

  private ctxDoc: any = {}

  constructor(synchronizer: Synchronizer) {
    this.#synchronizer = synchronizer
    this.pushPropertyStack()
  }

  // #region 覆盖 CanvasRenderingContext2D 上的方法
  public restore(): void {
    const property = this.#propertyStack.pop()
    if (property) {
      this.#globalAlpha = property.globalAlpha
      this.#globalCompositeOperation = property.globalCompositeOperation
      this.#imageSmoothingEnabled = property.imageSmoothingEnabled
      this.#imageSmoothingQuality = property.imageSmoothingQuality
      this.#fillStyle = property.fillStyle
      this.#strokeStyle = property.strokeStyle
      this.#shadowBlur = property.shadowBlur
      this.#shadowColor = property.shadowColor
      this.#shadowOffsetX = property.shadowOffsetX
      this.#shadowOffsetY = property.shadowOffsetY
      this.#filter = property.filter
      this.#lineCap = property.lineCap
      this.#lineDashOffset = property.lineDashOffset
      this.#lineJoin = property.lineJoin
      this.#lineWidth = property.lineWidth
      this.#miterLimit = property.miterLimit
      this.#direction = property.direction
      this.#font = property.font
      this.#textAlign = property.textAlign
      this.#textBaseline = property.textBaseline
    }
  }

  public save(): void {
    this.pushPropertyStack()
  }

  public getTransform(): DOMMatrix {
    return this.ctxDoc.getTransform()
  }

  public resetTransform(): void {
    return this.ctxDoc.resetTransform()
  }

  public rotate(angle: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.rotate, angle)
  }

  public scale(x: number, y: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.scale, [x, y])
  }

  public setTransform(a: number, b: number, c: number, d: number, e: number, f: number): void
  public setTransform(transform?: DOMMatrix2DInit): void
  public setTransform(a?: any, b?: any, c?: any, d?: any, e?: any, f?: any) {
    if (a === undefined) {
      this.#synchronizer.pushCommand(EnumMethodCommand.setTransform, [undefined])
    } else if (b === undefined) {
      this.#synchronizer.pushCommand(EnumMethodCommand.setTransform, [a])
    } else if (c !== undefined && d !== undefined && e !== undefined && f !== undefined) {
      this.#synchronizer.pushCommand(EnumMethodCommand.setTransform, [a, b, c, d, e, f])
    }
  }

  public transform(a: number, b: number, c: number, d: number, e: number, f: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.transform, [a, b, c, d, e, f])
  }

  public translate(x: number, y: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.translate, [x, y])
  }

  public createLinearGradient(x0: number, y0: number, x1: number, y1: number): CanvasGradient {
    return new CanvasLinearGradient(x0, y0, x1, y1)
  }

  // not support CanvasPattern
  // public createPattern(image: CanvasImageSource, repetition: string): CanvasPattern | null {
  //   return this.ctxDoc.createPattern(image, repetition)
  // }

  public createRadialGradient(x0: number, y0: number, r0: number, x1: number, y1: number, r1: number): CanvasGradient {
    return new CanvasRadialGradient(x0, y0, r0, x1, y1, r1)
  }

  public clearRect(x: number, y: number, w: number, h: number): void {
    if (x <= 0 && y <= 0) {
      this.#synchronizer.dryCommands()
    }
    this.#synchronizer.pushCommand(EnumMethodCommand.clearRect, [x, y, w, h])
  }

  public fillRect(x: number, y: number, w: number, h: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.fillRect, [x, y, w, h])
  }

  public strokeRect(x: number, y: number, w: number, h: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.strokeRect, [x, y, w, h])
  }

  public beginPath(): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.beginPath, undefined)
  }

  // not support clip Path2D
  // public clip(path: Path2D, fillRule?: CanvasFillRule): void
  public clip(fillRule?: CanvasFillRule): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.clip, [fillRule])
  }

  // not support fill Path2D
  // public fill(path: Path2D, fillRule?: CanvasFillRule): void
  public fill(fillRule?: CanvasFillRule): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.fill, [fillRule])
  }

  public isPointInPath(x: number, y: number, fillRule?: CanvasFillRule): boolean
  public isPointInPath(path: Path2D, x: number, y: number, fillRule?: CanvasFillRule): boolean
  public isPointInPath(path: any, x: any, y?: any, fillRule?: any) {
    return this.ctxDoc.isPointInPath(path, x, y, fillRule)
  }

  public isPointInStroke(x: number, y: number): boolean
  public isPointInStroke(path: Path2D, x: number, y: number): boolean
  public isPointInStroke(path: any, x: any, y?: any) {
    return this.ctxDoc.isPointInStroke(path, x, y)
  }

  // not support stroke Path2D
  // public stroke(path?: Path2D): void
  public stroke(): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.stroke, undefined)
  }

  public drawFocusIfNeeded(element: Element): void
  public drawFocusIfNeeded(path: Path2D, element: Element): void
  public drawFocusIfNeeded(path: any, element?: any) {
    return this.ctxDoc.drawFocusIfNeeded(path, element)
  }

  public scrollPathIntoView(): void
  public scrollPathIntoView(path?: Path2D): void {
    if (path !== undefined) {
      return this.ctxDoc.scrollPathIntoView(path)
    }
    return this.ctxDoc.scrollPathIntoView()
  }

  public fillText(text: string, x: number, y: number, maxWidth?: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.fillText, [text, x, y, maxWidth])
  }

  public measureText(text: string): TextMetrics {
    return this.ctxDoc.measureText(text)
  }

  public strokeText(text: string, x: number, y: number, maxWidth?: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.strokeText, [text, x, y, maxWidth])
  }

  public drawImage(image: CanvasImageSource, dx: number, dy: number): void
  public drawImage(image: CanvasImageSource, dx: number, dy: number, dw: number, dh: number): void
  public drawImage(
    image: CanvasImageSource,
    sx: number,
    sy: number,
    sw: number,
    sh: number,
    dx: number,
    dy: number,
    dw: number,
    dh: number
  ): void
  public drawImage(
    image: CanvasImageSource,
    sx: number,
    sy: number,
    sw?: number,
    sh?: number,
    dx?: number,
    dy?: number,
    dw?: number,
    dh?: number
  ) {
    if (dh !== undefined) {
      return this.ctxDoc.drawImage(image, sx, sy, sw!, sh!, dx!, dy!, dw!, dh)
    } else if (sh !== undefined) {
      return this.ctxDoc.drawImage(image, sx, sy, sw!, sh)
    } else {
      return this.ctxDoc.drawImage(image, sx, sy)
    }
  }

  public createImageData(sw: number, sh: number): ImageData
  public createImageData(imagedata: ImageData): ImageData
  public createImageData(sw: any, sh?: any) {
    if (typeof sw === 'number') {
      return new ImageData(sw, sh)
    } else {
      const data = sw as ImageData
      return new ImageData(data.width, data.height)
    }
  }

  public getImageData(sx: number, sy: number, sw: number, sh: number): ImageData {
    return this.ctxDoc.getImageData(sx, sy, sw, sh)
  }

  public putImageData(imagedata: ImageData, dx: number, dy: number): void
  public putImageData(
    imagedata: ImageData,
    dx: number,
    dy: number,
    dirtyX: number,
    dirtyY: number,
    dirtyWidth: number,
    dirtyHeight: number
  ): void
  public putImageData(
    imagedata: any,
    dx: any,
    dy: any,
    dirtyX?: any,
    dirtyY?: any,
    dirtyWidth?: any,
    dirtyHeight?: any
  ) {
    this.#synchronizer.pushCommand(EnumMethodCommand.putImageData, [
      imagedata,
      dx,
      dy,
      dirtyX,
      dirtyY,
      dirtyWidth,
      dirtyHeight,
    ])
  }

  public getLineDash(): number[] {
    return [...this.#lineDash]
  }

  public setLineDash(segments: number[]): void {
    this.#lineDash = [...segments]
    this.#synchronizer.pushCommand(EnumMethodCommand.setLineDash, [this.#lineDash])
  }

  public arc(
    x: number,
    y: number,
    radius: number,
    startAngle: number,
    endAngle: number,
    anticlockwise?: boolean
  ): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.arc, [x, y, radius, startAngle, endAngle, anticlockwise])
  }

  public arcTo(x1: number, y1: number, x2: number, y2: number, radius: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.arcTo, [x1, y1, x2, y2, radius])
  }

  public bezierCurveTo(cp1x: number, cp1y: number, cp2x: number, cp2y: number, x: number, y: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.bezierCurveTo, [cp1x, cp1y, cp2x, cp2y, x, y])
  }

  public closePath(): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.closePath, undefined)
  }

  public ellipse(
    x: number,
    y: number,
    radiusX: number,
    radiusY: number,
    rotation: number,
    startAngle: number,
    endAngle: number,
    anticlockwise?: boolean
  ): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.ellipse, [
      x,
      y,
      radiusX,
      radiusY,
      rotation,
      startAngle,
      endAngle,
      anticlockwise,
    ])
  }

  public lineTo(x: number, y: number): void {
    console.log('lineTo', x, y)
    this.#synchronizer.pushCommand(EnumMethodCommand.lineTo, [x, y])
  }

  public moveTo(x: number, y: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.moveTo, [x, y])
  }

  public quadraticCurveTo(cpx: number, cpy: number, x: number, y: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.quadraticCurveTo, [cpx, cpy, x, y])
  }

  public rect(x: number, y: number, w: number, h: number): void {
    this.#synchronizer.pushCommand(EnumMethodCommand.rect, [x, y, w, h])
  }
  // #endregion

  private pushPropertyStack() {
    this.#propertyStack.push({
      globalAlpha: this.#globalAlpha,
      globalCompositeOperation: this.#globalCompositeOperation,
      imageSmoothingEnabled: this.#imageSmoothingEnabled,
      imageSmoothingQuality: this.#imageSmoothingQuality,
      fillStyle: this.#fillStyle,
      strokeStyle: this.#strokeStyle,
      shadowBlur: this.#shadowBlur,
      shadowColor: this.#shadowColor,
      shadowOffsetX: this.#shadowOffsetX,
      shadowOffsetY: this.#shadowOffsetY,
      filter: this.#filter,
      lineCap: this.#lineCap,
      lineDashOffset: this.#lineDashOffset,
      lineJoin: this.#lineJoin,
      lineWidth: this.#lineWidth,
      miterLimit: this.#miterLimit,
      direction: this.#direction,
      font: this.#font,
      textAlign: this.#textAlign,
      textBaseline: this.#textBaseline,
    })
  }
}
