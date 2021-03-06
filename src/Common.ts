export enum EnumPropertyCommand {
  globalAlpha = 0,
  globalCompositeOperation,
  imageSmoothingEnabled,
  imageSmoothingQuality,
  fillStyle,
  strokeStyle,
  shadowBlur,
  shadowColor,
  shadowOffsetX,
  shadowOffsetY,
  filter,
  lineCap,
  lineDashOffset,
  lineJoin,
  lineWidth,
  miterLimit,
  direction,
  font,
  textAlign,
  textBaseline,
}

export enum EnumMethodCommand {
  restore = 127,
  save,
  getTransform,
  resetTransform,
  rotate,
  scale,
  setTransform,
  transform,
  translate,
  createLinearGradient,
  createPattern,
  createRadialGradient,
  clearRect,
  fillRect,
  strokeRect,
  beginPath,
  clip,
  fill,
  isPointInPath,
  isPointInStroke,
  stroke,
  drawFocusIfNeeded,
  scrollPathIntoView,
  fillText,
  measureText,
  strokeText,
  drawImage,
  createImageData,
  getImageData,
  putImageData,
  getLineDash,
  setLineDash,
  arc,
  arcTo,
  bezierCurveTo,
  closePath,
  ellipse,
  lineTo,
  moveTo,
  quadraticCurveTo,
  rect,
}

export enum EnumCompositeOperation {
  SourceOver = 'source-over',
  SourceIn = 'source-in',
  SourceOut = 'source-out',
  SourceAtop = 'source-atop',
  DestinationOver = 'destination-over',
  DestinationIn = 'destination-in',
  DestinationOut = 'destination-out',
  DestinationAtop = 'destination-atop',
  Lighter = 'lighter',
  Copy = 'copy',
  Xor = 'xor',
  Multiply = 'multiply',
  Screen = 'screen',
  Overlay = 'overlay',
  Darken = 'darken',
  Lighten = 'lighten',
  ColorDodge = 'color-dodge',
  ColorBurn = 'color-burn',
  HardLight = 'hard-light',
  SoftLight = 'soft-light',
  Difference = 'difference',
  Exclusion = 'exclusion',
  Hue = 'hue',
  Saturation = 'saturation',
  Color = 'color',
  Luminosity = 'luminosity',
}

export interface ImageData {
  data: Uint8Array
  width: number
  height: number
}
