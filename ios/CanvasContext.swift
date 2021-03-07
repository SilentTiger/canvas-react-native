//
//  CanvasContext.swift
//  canvas-react-native
//
//  Created by Tiger on 2021/2/10.
//

import Foundation

class CanvasContext {
    var shadowOffsetX: CGFloat = 0
    var shadowOffsetY: CGFloat = 0
    var shadowBlur: CGFloat = 0
    var shadowColor: CGColor = UIColor(hex: "#000000").cgColor
    var lineDashPhase: CGFloat = 0
    var lineDashLength: [CGFloat] = []
    
    var pathBegan: Bool = false
    //    var fillStyle,
    //    var strokeStyle,
    //    var shadowBlur,
    //    var shadowColor,
    //    var shadowOffsetX,
    //    var shadowOffsetY,
    //    var filter,
    //    var lineCap,
    //    var lineDashOffset,
    //    var lineJoin,
    //    var lineWidth,
    //    var miterLimit,
    //    var direction,
    //    var font,
    //    var textAlign,
    //    var textBaseline,
    
    var currentPoint: CGPoint = CGPoint(x:0, y: 0)

    init(){
        
    }

    public func processCommands(commands: [CanvasCommandStruct], layer: CAShapeLayer, context: CGContext){
        print("start process command")
        for command in commands {
            switch command.cmdType {
            case EnumPropertyCommand.globalAlpha.rawValue:
                self.globalAlphaProperty(command: command, context: context)
            case EnumPropertyCommand.globalCompositeOperation.rawValue:
                self.globalCompositeOperationProperty(command: command, context: context)
            case EnumPropertyCommand.imageSmoothingEnabled.rawValue:
                self.imageSmoothingEnabledProperty(command: command, context: context)
            case EnumPropertyCommand.imageSmoothingQuality.rawValue:
                self.imageSmoothingQualityProperty(command: command, context: context)
            case EnumPropertyCommand.fillStyle.rawValue:
                self.fillStyleProperty(command: command, context: context)
            case EnumPropertyCommand.strokeStyle.rawValue:
                self.strokeStyleProperty(command: command, context: context)
            case EnumPropertyCommand.shadowBlur.rawValue:
                self.shadowBlurProperty(command: command, context: context)
            case EnumPropertyCommand.shadowColor.rawValue:
                self.shadowColorProperty(command: command, context: context)
            case EnumPropertyCommand.shadowOffsetX.rawValue:
                self.shadowOffsetXProperty(command: command, context: context)
            case EnumPropertyCommand.shadowOffsetY.rawValue:
                self.shadowOffsetYProperty(command: command, context: context)
            case EnumPropertyCommand.lineCap.rawValue:
                self.lineCapProperty(command: command, context: context)
            case EnumPropertyCommand.lineDashOffset.rawValue:
                self.lineDashOffsetProperty(command: command, context: context)
            case EnumPropertyCommand.lineJoin.rawValue:
                self.lineJoinProperty(command: command, context: context)
            case EnumPropertyCommand.lineWidth.rawValue:
                self.lineWidthProperty(command: command, context: context)
            case EnumPropertyCommand.miterLimit.rawValue:
                self.miterLimitProperty(command: command, context: context)
            case EnumPropertyCommand.font.rawValue:
                self.fontProperty(command: command, context: context)
            case EnumPropertyCommand.textBaseline.rawValue:
                self.textBaselineProperty(command: command, context: context)

            case EnumMethodCommand.getTransform.rawValue:
                self.getTransformMethod(command: command, context: context)
            case EnumMethodCommand.resetTransform.rawValue:
                self.resetTransformMethod(command: command, context: context)
            case EnumMethodCommand.rotate.rawValue:
                self.rotateMethod(command: command, context: context)
            case EnumMethodCommand.scale.rawValue:
                self.scaleMethod(command: command, context: context)
            case EnumMethodCommand.setTransform.rawValue:
                self.setTransformMethod(command: command, context: context)
            case EnumMethodCommand.transform.rawValue:
                self.transformMethod(command: command, context: context)
            case EnumMethodCommand.translate.rawValue:
                self.translateMethod(command: command, context: context)
            case EnumMethodCommand.createLinearGradient.rawValue:
                self.createLinearGradientMethod(command: command, context: context)
            case EnumMethodCommand.createPattern.rawValue:
                self.createPatternMethod(command: command, context: context)
            case EnumMethodCommand.createRadialGradient.rawValue:
                self.createRadialGradientMethod(command: command, context: context)
            case EnumMethodCommand.clearRect.rawValue:
                self.clearRectMethod(command: command, context: context)
            case EnumMethodCommand.fillRect.rawValue:
                self.fillRectMethod(command: command, context: context)
            case EnumMethodCommand.strokeRect.rawValue:
                self.strokeRectMethod(command: command, context: context)
            case EnumMethodCommand.beginPath.rawValue:
                self.beginPathMethod(command: command, context: context)
            case EnumMethodCommand.clip.rawValue:
                self.clipMethod(command: command, context: context)
            case EnumMethodCommand.fill.rawValue:
                self.fillMethod(command: command, context: context)
            case EnumMethodCommand.isPointInPath.rawValue:
                self.isPointInPathMethod(command: command, context: context)
            case EnumMethodCommand.isPointInStroke.rawValue:
                self.isPointInStrokeMethod(command: command, context: context)
            case EnumMethodCommand.stroke.rawValue:
                self.strokeMethod(command: command, context: context)
            case EnumMethodCommand.drawFocusIfNeeded.rawValue:
                self.drawFocusIfNeededMethod(command: command, context: context)
            case EnumMethodCommand.scrollPathIntoView.rawValue:
                self.scrollPathIntoViewMethod(command: command, context: context)
            case EnumMethodCommand.fillText.rawValue:
                self.fillTextMethod(command: command, context: context)
            case EnumMethodCommand.measureText.rawValue:
                self.measureTextMethod(command: command, context: context)
            case EnumMethodCommand.strokeText.rawValue:
                self.strokeTextMethod(command: command, context: context)
            case EnumMethodCommand.drawImage.rawValue:
                self.drawImageMethod(command: command, context: context)
            case EnumMethodCommand.createImageData.rawValue:
                self.createImageDataMethod(command: command, context: context)
            case EnumMethodCommand.getImageData.rawValue:
                self.getImageDataMethod(command: command, context: context)
            case EnumMethodCommand.putImageData.rawValue:
                self.putImageDataMethod(command: command, context: context)
            case EnumMethodCommand.getLineDash.rawValue:
                self.getLineDashMethod(command: command, context: context)
            case EnumMethodCommand.setLineDash.rawValue:
                self.setLineDashMethod(command: command, context: context)
            case EnumMethodCommand.arc.rawValue:
                self.arcMethod(command: command, context: context)
            case EnumMethodCommand.arcTo.rawValue:
                self.arcToMethod(command: command, context: context)
            case EnumMethodCommand.bezierCurveTo.rawValue:
                self.bezierCurveToMethod(command: command, context: context)
            case EnumMethodCommand.closePath.rawValue:
                self.closePathMethod(command: command, context: context)
            case EnumMethodCommand.ellipse.rawValue:
                self.ellipseMethod(command: command, context: context)
            case EnumMethodCommand.lineTo.rawValue:
                self.lineToMethod(command: command, context: context)
            case EnumMethodCommand.moveTo.rawValue:
                self.moveToMethod(command: command, context: context)
            case EnumMethodCommand.quadraticCurveTo.rawValue:
                self.quadraticCurveToMethod(command: command, context: context)
            case EnumMethodCommand.rect.rawValue:
                self.rectMethod(command: command, context: context)

            default:
                print("unknown command type")
            }
        }
    }
    
    private func globalAlphaProperty(command: CanvasCommandStruct, context: CGContext) {
        print("globalAlphaProperty", command)
        let value = command.args[0] as? Double ?? 1
        context.setAlpha(CGFloat(value))
    }
    private func globalCompositeOperationProperty(command: CanvasCommandStruct, context: CGContext) {
        print("globalCompositeOperationProperty", command)
        let value = command.args[0] as? String ?? "source-over"
        switch value {
        case "source-over":
            context.setBlendMode(CGBlendMode.normal)
        case "source-in":
            context.setBlendMode(CGBlendMode.sourceIn)
        case "source-out":
            context.setBlendMode(CGBlendMode.sourceOut)
        case "source-atop":
            context.setBlendMode(CGBlendMode.sourceAtop)
        case "destination-over":
            context.setBlendMode(CGBlendMode.destinationOver)
        case "destination-in":
            context.setBlendMode(CGBlendMode.destinationIn)
        case "destination-out":
            context.setBlendMode(CGBlendMode.destinationOut)
        case "destination-atop":
            context.setBlendMode(CGBlendMode.destinationAtop)
        case "lighter":
            context.setBlendMode(CGBlendMode.plusLighter)
        case "copy":
            context.setBlendMode(CGBlendMode.copy)
        case "xor":
            context.setBlendMode(CGBlendMode.xor)
        case "multiply":
            context.setBlendMode(CGBlendMode.multiply)
        case "screen":
            context.setBlendMode(CGBlendMode.screen)
        case "overlay":
            context.setBlendMode(CGBlendMode.overlay)
        case "darken":
            context.setBlendMode(CGBlendMode.darken)
        case "lighten":
            context.setBlendMode(CGBlendMode.lighten)
        case "color-dodge":
            context.setBlendMode(CGBlendMode.colorDodge)
        case "color-burn":
            context.setBlendMode(CGBlendMode.colorBurn)
        case "hard-light":
            context.setBlendMode(CGBlendMode.hardLight)
        case "soft-light":
            context.setBlendMode(CGBlendMode.softLight)
        case "difference":
            context.setBlendMode(CGBlendMode.difference)
        case "exclusion":
            context.setBlendMode(CGBlendMode.exclusion)
        case "hue":
            context.setBlendMode(CGBlendMode.hue)
        case "saturation":
            context.setBlendMode(CGBlendMode.saturation)
        case "color":
            context.setBlendMode(CGBlendMode.color)
        case "luminosity":
            context.setBlendMode(CGBlendMode.luminosity)
        default:
            print("unknown globalCompositeOperation value", value)
        }
    }
    private func imageSmoothingEnabledProperty(command: CanvasCommandStruct, context: CGContext) {
        print("imageSmoothingEnabledProperty", command)
    }
    private func imageSmoothingQualityProperty(command: CanvasCommandStruct, context: CGContext) {
        print("imageSmoothingQualityProperty", command)
    }
    private func fillStyleProperty(command: CanvasCommandStruct, context: CGContext) {
        print("fillStyleProperty", command)
        let value = command.args[0]
        if (value is CanvasLinearGradientStruct) {
            // todo
        } else if (value is CanvasRadialGradientStruct) {
            // todo
        } else if(value is String){
            let color = UIColor(hex: value as? String)
            context.setFillColor(color.cgColor)
        } else {
            print("unknown fillStyle value", value)
        }
    }
    private func strokeStyleProperty(command: CanvasCommandStruct, context: CGContext) {
        print("strokeStyleProperty", command)
        let value = command.args[0]
        if (value is CanvasLinearGradientStruct) {
            // todo
        } else if (value is CanvasRadialGradientStruct) {
            // todo
        } else if(value is String){
            let color = UIColor(hex: value as? String)
            context.setStrokeColor(color.cgColor)
        } else {
            print("unknown strokeStyle value", value)
        }
    }
    private func shadowBlurProperty(command: CanvasCommandStruct, context: CGContext) {
        print("shadowBlurProperty", command)
        let value = command.args[0] as? CGFloat ?? 0
        self.shadowBlur = value
        context.setShadow(offset: CGSize(width: self.shadowOffsetX, height: self.shadowOffsetY), blur: self.shadowBlur, color: self.shadowColor)
    }
    private func shadowColorProperty(command: CanvasCommandStruct, context: CGContext) {
        print("shadowColorProperty", command)
        let value = command.args[0] as? String ?? "000000"
        self.shadowColor = UIColor(hex: value).cgColor
        context.setShadow(offset: CGSize(width: self.shadowOffsetX, height: self.shadowOffsetY), blur: self.shadowBlur, color: self.shadowColor)
    }
    private func shadowOffsetXProperty(command: CanvasCommandStruct, context: CGContext) {
        print("shadowOffsetXProperty", command)
        let value = command.args[0] as? CGFloat ?? 0
        self.shadowOffsetX = value
        context.setShadow(offset: CGSize(width: self.shadowOffsetX, height: self.shadowOffsetY), blur: self.shadowBlur, color: self.shadowColor)
    }
    private func shadowOffsetYProperty(command: CanvasCommandStruct, context: CGContext) {
        print("shadowOffsetYProperty", command)
        let value = command.args[0] as? CGFloat ?? 0
        self.shadowOffsetY = value
        context.setShadow(offset: CGSize(width: self.shadowOffsetX, height: self.shadowOffsetY), blur: self.shadowBlur, color: self.shadowColor)
    }
    private func lineCapProperty(command: CanvasCommandStruct, context: CGContext) {
        print("lineCapProperty", command)
        let value = command.args[0] as? String ?? "butt"
        switch value {
        case "butt":
            context.setLineCap(CGLineCap.butt)
        case "round":
            context.setLineCap(CGLineCap.round)
        case "square":
            context.setLineCap(CGLineCap.square)
        default:
            print("unknown lineCap value", value)
        }
    }
    private func lineDashOffsetProperty(command: CanvasCommandStruct, context: CGContext) {
        print("lineDashOffsetProperty", command)
        let value = command.args[0] as? CGFloat ?? 0
        self.lineDashPhase = value
        context.setLineDash(phase: self.lineDashPhase, lengths: self.lineDashLength)
    }
    private func lineJoinProperty(command: CanvasCommandStruct, context: CGContext) {
        print("lineJoinProperty", command)
        let join = command.args[0] as? String ?? "miter"
        switch join {
        case "miter":
            context.setLineJoin(CGLineJoin.miter)
            break
        case "bevel":
            context.setLineJoin(CGLineJoin.bevel)
            break
        case "round":
            context.setLineCap(CGLineCap.round)
            context.setLineJoin(CGLineJoin.round)
            break
        default:
            print("unknown lineJoin value", join)
        }
    }
    private func lineWidthProperty(command: CanvasCommandStruct, context: CGContext) {
        print("lineWidthProperty", command)
        let width = command.args[0] as? Double ?? 1
        context.setLineWidth(CGFloat(width))
    }
    private func miterLimitProperty(command: CanvasCommandStruct, context: CGContext) {
        print("miterLimitProperty", command)
        let value = command.args[0] as? CGFloat ?? 0
        context.setMiterLimit(value)
    }
    private func fontProperty(command: CanvasCommandStruct, context: CGContext) {
        print("fontProperty", command)
        // todo
    }
    private func textBaselineProperty(command: CanvasCommandStruct, context: CGContext) {
        print("textBaselineProperty", command)
        // todo
    }

    private func getTransformMethod(command: CanvasCommandStruct, context: CGContext) {
        print("getTransform", command)
    }

    private func resetTransformMethod(command: CanvasCommandStruct, context: CGContext) {
        print("resetTransform", command)
    }

    private func rotateMethod(command: CanvasCommandStruct, context: CGContext) {
        print("rotate", command)
        let angle = command.args[0] as? Double ?? 0
        context.rotate(by: CGFloat(angle))
    }

    private func scaleMethod(command: CanvasCommandStruct, context: CGContext) {
        print("scale", command)
        let x = command.args[0] as? Double ?? 0
        let y = command.args[1] as? Double ?? 0
        context.scaleBy(x: CGFloat(x), y: CGFloat(y))
    }

    private func setTransformMethod(command: CanvasCommandStruct, context: CGContext) {
        print("setTransform", command)
    }

    private func transformMethod(command: CanvasCommandStruct, context: CGContext) {
        print("transform", command)
        let a = CGFloat(command.args[0] as? Double ?? 0)
        let b = CGFloat(command.args[1] as? Double ?? 0)
        let c = CGFloat(command.args[2] as? Double ?? 0)
        let d = CGFloat(command.args[3] as? Double ?? 0)
        let x = CGFloat(command.args[4] as? Double ?? 0)
        let y = CGFloat(command.args[5] as? Double ?? 0)
        context.concatenate(CGAffineTransform(a: a, b: b, c: c, d: d, tx: x, ty: y))
    }

    private func translateMethod(command: CanvasCommandStruct, context: CGContext) {
        print("translate", command)
        let x = command.args[0] as? Double ?? 0
        let y = command.args[1] as? Double ?? 0
        context.translateBy(x: CGFloat(x), y: CGFloat(y))
    }

    private func createLinearGradientMethod(command: CanvasCommandStruct, context: CGContext) {
        print("createLinearGradient", command)
    }

    private func createPatternMethod(command: CanvasCommandStruct, context: CGContext) {
        print("createPattern", command)
    }

    private func createRadialGradientMethod(command: CanvasCommandStruct, context: CGContext) {
        print("createRadialGradient", command)
    }

    private func clearRectMethod(command: CanvasCommandStruct, context: CGContext) {
        print("clearRect", command)
    }

    private func fillRectMethod(command: CanvasCommandStruct, context: CGContext) {
        print("fillRect", command)
        let x = command.args[0] as? Double ?? 0
        let y = command.args[1] as? Double ?? 0
        let width = command.args[2] as? Double ?? 0
        let height = command.args[3] as? Double ?? 0
        let rect = CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height))
        context.fill(rect)
    }

    private func strokeRectMethod(command: CanvasCommandStruct, context: CGContext) {
        print("strokeRect", command)
        let x = command.args[0] as? Double ?? 0
        let y = command.args[1] as? Double ?? 0
        let width = command.args[2] as? Double ?? 0
        let height = command.args[3] as? Double ?? 0
        let rect = CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height))
        context.stroke(rect)
    }

    private func beginPathMethod(command: CanvasCommandStruct, context: CGContext) {
        print("beginPath", command)
        context.beginPath()
        self.pathBegan = true
        context.move(to: CGPoint(x: 0, y: 0))
    }

    private func clipMethod(command: CanvasCommandStruct, context: CGContext) {
        print("clip", command)
    }

    private func fillMethod(command: CanvasCommandStruct, context: CGContext) {
        print("fill", command)
        let fillRule = command.args[0] as? String ?? "nonzero"
        switch fillRule {
        case "evenodd":
            context.fillPath(using: CGPathFillRule.evenOdd)
        case "nonzero":
            context.fillPath(using: CGPathFillRule.winding)
        default:
            print("unknown fillRule", fillRule)
        }
        self.pathBegan = false
    }

    private func isPointInPathMethod(command: CanvasCommandStruct, context: CGContext) {
        print("isPointInPath", command)
    }

    private func isPointInStrokeMethod(command: CanvasCommandStruct, context: CGContext) {
        print("isPointInStroke", command)
    }

    private func strokeMethod(command: CanvasCommandStruct, context: CGContext) {
        print("stroke", command)
        context.strokePath()
        self.pathBegan = false
    }

    private func drawFocusIfNeededMethod(command: CanvasCommandStruct, context: CGContext) {
        print("drawFocusIfNeeded", command)
    }

    private func scrollPathIntoViewMethod(command: CanvasCommandStruct, context: CGContext) {
        print("scrollPathIntoView", command)
    }

    private func fillTextMethod(command: CanvasCommandStruct, context: CGContext) {
        print("fillText", command)
    }

    private func measureTextMethod(command: CanvasCommandStruct, context: CGContext) {
        print("measureText", command)
    }

    private func strokeTextMethod(command: CanvasCommandStruct, context: CGContext) {
        print("strokeText", command)
    }

    private func drawImageMethod(command: CanvasCommandStruct, context: CGContext) {
        print("drawImage", command)
    }

    private func createImageDataMethod(command: CanvasCommandStruct, context: CGContext) {
        print("createImageData", command)
    }

    private func getImageDataMethod(command: CanvasCommandStruct, context: CGContext) {
        print("getImageData", command)
    }

    private func putImageDataMethod(command: CanvasCommandStruct, context: CGContext) {
        print("putImageData", command)
        let imageData: [UInt8] = command.args[0] as? [UInt8] ?? []
        let x = command.args[1] as? UInt64 ?? 0
        let y = command.args[2] as? UInt64 ?? 0
        let width = command.args[3] as? Int ?? 0
        let height = command.args[4] as? Int ?? 0
        
        let bitsPerComponent = 8
        let bitsPerPixel = bitsPerComponent * 4
        let bytesPerRow = bitsPerPixel * width / 8

        // reverse imageData by row
        var reversedImageData: [UInt8] = []
        var index = imageData.count / bytesPerRow
        while index > 0 {
            var indexInRow = 0
            while indexInRow < bytesPerRow {
                reversedImageData.append(imageData[(index - 1) * bytesPerRow + indexInRow])
                indexInRow += 1
            }
            index -= 1
        }
        
        let colorspace = CGColorSpaceCreateDeviceRGB();
        let rgbData = CFDataCreate(kCFAllocatorDefault, reversedImageData, width * height * bitsPerPixel);
        let provider = CGDataProvider(data: rgbData!);
        let bimapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.last.rawValue)
            .union(.byteOrder32Big)
        let rgbImageRef = CGImage(width: width, height: height, bitsPerComponent: bitsPerComponent, bitsPerPixel: bitsPerPixel, bytesPerRow: bytesPerRow, space: colorspace, bitmapInfo: bimapInfo, provider: provider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent);
        
        context.draw(rgbImageRef!, in: CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height)), byTiling: false)
    }

    private func getLineDashMethod(command: CanvasCommandStruct, context: CGContext) {
        print("getLineDash", command)
    }

    private func setLineDashMethod(command: CanvasCommandStruct, context: CGContext) {
        print("setLineDash", command)
        self.lineDashLength = command.args[0] as? [CGFloat] ?? []
        context.setLineDash(phase: self.lineDashPhase, lengths: self.lineDashLength)
    }

    private func arcMethod(command: CanvasCommandStruct, context: CGContext) {
        print("arc", command)
        let x = command.args[0] as? Double ?? 0
        let y = command.args[1] as? Double ?? 0
        let r = command.args[2] as? Double ?? 0
        let startAngle = command.args[3] as? Double ?? 0
        let endAngle = command.args[4] as? Double ?? 0
        let anticlockwise = command.args[5] as? Bool ?? false

        let startPointX = x + cos(startAngle) * r
        let startPointY = y - sin(startAngle) * r
        if(self.pathBegan){
            context.addLine(to: CGPoint(x: CGFloat(startPointX), y: CGFloat(startPointY)))
        }
        self.pathBegan = true
        context.addArc(center: CGPoint(x: CGFloat(x), y: CGFloat(y)), radius: CGFloat(r), startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: anticlockwise)
        let endPointX = x + cos(endAngle) * r
        let endPointY = y - sin(endAngle) * r
        self.currentPoint = CGPoint(x: endPointX, y: endPointY)
    }

    private func arcToMethod(command: CanvasCommandStruct, context: CGContext) {
        print("arcTo", command)
        let cp1x = command.args[0] as? Double ?? 0
        let cp1y = command.args[1] as? Double ?? 0
        let cp2x = command.args[2] as? Double ?? 0
        let cp2y = command.args[3] as? Double ?? 0
        let r = command.args[4] as? Double ?? 0
        
        if(!self.pathBegan) {
            context.beginPath()
            context.move(to: self.currentPoint)
            self.pathBegan = true
        }

        context.addArc(tangent1End: CGPoint(x: CGFloat(cp1x), y: CGFloat(cp1y)), tangent2End: CGPoint(x: CGFloat(cp2x), y: CGFloat(cp2y)), radius: CGFloat(r))
    }

    private func bezierCurveToMethod(command: CanvasCommandStruct, context: CGContext) {
        print("bezierCurveTo", command)
        let cp1x = command.args[0] as? Double ?? 0
        let cp1y = command.args[1] as? Double ?? 0
        let cp2x = command.args[2] as? Double ?? 0
        let cp2y = command.args[3] as? Double ?? 0
        let x = command.args[4] as? Double ?? 0
        let y = command.args[5] as? Double ?? 0

        if(!self.pathBegan) {
            context.beginPath()
            context.move(to: self.currentPoint)
            self.pathBegan = true
        }

        context.addCurve(to: CGPoint(x: CGFloat(x), y: CGFloat(y)), control1: CGPoint(x: CGFloat(cp1x), y: CGFloat(cp1y)), control2: CGPoint(x: CGFloat(cp2x), y: CGFloat(cp2y)))
        self.currentPoint=CGPoint(x: CGFloat(x), y: CGFloat(y))
    }

    private func closePathMethod(command: CanvasCommandStruct, context: CGContext) {
        print("closePath", command)
        context.closePath()
    }

    private func ellipseMethod(command: CanvasCommandStruct, context: CGContext) {
        print("ellipse", command)
    }

    private func lineToMethod(command: CanvasCommandStruct, context: CGContext) {
        print("lineTo", command)
        if(!self.pathBegan) {
            context.beginPath()
            context.move(to: self.currentPoint)
            self.pathBegan = true
        }

        let x = command.args[0] as? Double ?? 0
        let y = command.args[1] as? Double ?? 0

        let targetPoint = CGPoint(x: x, y: y)
        context.addLine(to: targetPoint)
        self.currentPoint = targetPoint
    }

    private func moveToMethod(command: CanvasCommandStruct, context: CGContext) {
        print("moveTo", command)
        let x = command.args[0] as? Double ?? 0
        let y = command.args[1] as? Double ?? 0
        let targetPoint = CGPoint(x: x, y: y)
        context.move(to: targetPoint)
        self.currentPoint = targetPoint
    }

    private func quadraticCurveToMethod(command: CanvasCommandStruct, context: CGContext) {
        print("quadraticCurveTo", command)
        let cpx = command.args[0] as? Double ?? 0
        let cpy = command.args[1] as? Double ?? 0
        let x = command.args[2] as? Double ?? 0
        let y = command.args[3] as? Double ?? 0

        if(!self.pathBegan) {
            context.beginPath()
            context.move(to: self.currentPoint)
            self.pathBegan = true
        }

        context.addQuadCurve(to: CGPoint(x: CGFloat(x), y: CGFloat(y)), control: CGPoint(x: CGFloat(cpx), y: CGFloat(cpy)))
        self.currentPoint=CGPoint(x: CGFloat(x), y: CGFloat(y))
    }

    private func rectMethod(command: CanvasCommandStruct, context: CGContext) {
        print("rect", command)
        
        let x = command.args[0] as? Double ?? 0
        let y = command.args[1] as? Double ?? 0
        let width = command.args[2] as? Double ?? 0
        let height = command.args[3] as? Double ?? 0
        context.addRect(CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height)))
        self.currentPoint=CGPoint(x: CGFloat(x), y: CGFloat(y))
    }

}
