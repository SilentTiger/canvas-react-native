//
//  Canvas.swift
//  canvas-react-native
//
//  Created by Tiger on 2020/12/4.
//

import Foundation

class Canvas: UIView {
    private var pos: Float = 0
    private let r: Float = 50
    private var drawingLayer: CAShapeLayer!

//    override func draw(_ rect: CGRect) {
//      // 1
//      guard let context = UIGraphicsGetCurrentContext() else {
//        return
//      }
//
//      // 2
//        context.setFillColor(UIColor.yellow.cgColor)
//        context.setLineWidth(5)
//        UIColor.red.set()
//      // 3
//        let y = sin(pos) * r + 100
//        let x = cos(pos) * r + 100
//        context.addRect(CGRect.init(x: Int(x), y: Int(y), width: 20, height: 20))
//        context.strokePath()
//    }
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        // 1
        let drawingLayer = self.drawingLayer ?? CAShapeLayer()
        // 2
        drawingLayer.contentsScale = UIScreen.main.scale
        // 3
        let linePath = UIBezierPath()
        // 4
//        for (index, point) in line.enumerated() {
//            if index == 0 {
//                linePath.move(to: point)
//            } else {
//                linePath.addLine(to: point)
//            }
//        }

        let y = Int(sin(pos) * r)
        let x = Int(cos(pos) * r)
        linePath.move(to: CGPoint(x: x, y: y))
        linePath.addLine(to: CGPoint(x: x, y: y+20))
        linePath.addLine(to: CGPoint(x: x+20, y: y+20))
        linePath.addLine(to: CGPoint(x: x+20, y: y))
        linePath.addLine(to: CGPoint(x: x, y: y))

        drawingLayer.path = linePath.cgPath
        drawingLayer.opacity = 1
        drawingLayer.lineWidth = 5
        drawingLayer.lineCap = .round
        drawingLayer.fillColor = UIColor.clear.cgColor
        drawingLayer.strokeColor = UIColor.red.cgColor

        // 5
        if self.drawingLayer == nil {
            self.drawingLayer = drawingLayer
            layer.addSublayer(drawingLayer)
        }
//        print("draw layer",x,y)
    }
    
    public func sync(command: NSString) {
        print("sync command", command)
    }
}
