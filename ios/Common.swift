//
//  Common.swift
//  canvas-react-native
//
//  Created by Tiger on 2021/2/10.
//

import Foundation

enum EnumPropertyCommand: UInt8 {
  case globalAlpha = 0,
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
  textBaseline
}

enum EnumMethodCommand: UInt8 {
  case restore = 127,
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
  rect
}

struct CanvasCommandStruct {
    var id: UInt64
    var cmdType: UInt8
    var args: [Any]
    
    init(id: UInt64, cmdType: UInt8, args: [Any]) {
        self.id = id
        self.cmdType = cmdType
        self.args = args
    }
}

enum EnumCompositeOperation: String {
  case SourceOver = "source-over"
  case SourceIn = "source-in"
  case SourceOut = "source-out"
  case SourceAtop = "source-atop"
  case DestinationOver = "destination-over"
  case DestinationIn = "destination-in"
  case DestinationOut = "destination-out"
  case DestinationAtop = "destination-atop"
  case Lighter = "lighter"
  case Copy = "copy"
  case Xor = "xor"
  case Multiply = "multiply"
  case Screen = "screen"
  case Overlay = "overlay"
  case Darken = "darken"
  case Lighten = "lighten"
  case ColorDodge = "color-dodge"
  case ColorBurn = "color-burn"
  case HardLight = "hard-light"
  case SoftLight = "soft-light"
  case Difference = "difference"
  case Exclusion = "exclusion"
  case Hue = "hue"
  case Saturation = "saturation"
  case Color = "color"
  case Luminosity = "luminosity"
}

enum ImageSmoothingQuality: String {
    case High = "high"
    case Low = "low"
    case Medium = "medium"
}

struct CanvasLinearGradientStruct {
    var x0: Double
    var y0: Double
    var x1: Double
    var y1: Double
}

struct CanvasRadialGradientStruct {
    var x0: Double
    var y0: Double
    var r0: Double
    var x1: Double
    var y1: Double
    var r1: Double
}