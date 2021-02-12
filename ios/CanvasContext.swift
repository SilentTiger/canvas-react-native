//
//  CanvasContext.swift
//  canvas-react-native
//
//  Created by Tiger on 2021/2/10.
//

import Foundation

class CanvasContext {
    var globalAlpha = 0
    var globalCompositeOperation = EnumCompositeOperation.SourceOver
    var imageSmoothingEnabled: Bool = true
    var imageSmoothingQuality: ImageSmoothingQuality = ImageSmoothingQuality.High
    var shadowOffsetX: CGFloat = 0
    var shadowOffsetY: CGFloat = 0
    var shadowBlur: CGFloat = 0
    var shadowColor: CGColor = UIColor(hex: "#000000").cgColor
    var lineDashPhase: CGFloat = 0
    var lineDashLength: [CGFloat] = []
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
            case EnumPropertyCommand.lineJoin.rawValue:
                self.lineJoinProperty(command: command, context: context)
            case EnumPropertyCommand.lineWidth.rawValue:
                self.lineWidthProperty(command: command, context: context)
                break
            case EnumMethodCommand.lineTo.rawValue:
                self.lineToMethod(command: command, context: context)
                break
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
            let color = UIColor(hex: value as! String)
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
            let color = UIColor(hex: value as! String)
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
        let value = command.args[0] as? String ?? ""
        // todo
    }
    private func textBaselineProperty(command: CanvasCommandStruct, context: CGContext) {
        print("textBaselineProperty", command)
        let value = command.args[0] as? String ?? ""
        // todo
    }
    
    private func setLineDash(command: CanvasCommandStruct, context: CGContext) {
        print("setLineDash", command)
        self.lineDashLength = command.args[0] as? [CGFloat] ?? []
        context.setLineDash(phase: self.lineDashPhase, lengths: self.lineDashLength)
    }
    
    private func lineToMethod(command: CanvasCommandStruct, context: CGContext) {
        print("lineTo", command)
        let x = command.args[0] as? Double ?? 0
        let y = command.args[1] as? Double ?? 0

        let targetPoint = CGPoint(x: x, y: y)
        context.beginPath()
        context.move(to: self.currentPoint)
        context.addLine(to: targetPoint)
        context.strokePath()
        self.currentPoint = targetPoint
    }
}
