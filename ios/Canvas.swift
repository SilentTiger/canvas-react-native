//
//  Canvas.swift
//  canvas-react-native
//
//  Created by SilentTiger on 2021/02/2.
//
import Foundation

class Canvas: UIView {
    private var commands: [CanvasCommandStruct] = []
    private let ctx: CanvasContext = CanvasContext()
    private var drawingLayer: CAShapeLayer!
    
    override func draw(_ layer: CALayer, in context: CGContext) {
        print("on draw")
        let drawingLayer = self.drawingLayer ?? CAShapeLayer()

        self.ctx.processCommands(commands: self.commands, layer: drawingLayer, context: context)

        if self.drawingLayer == nil {
            self.drawingLayer = drawingLayer
            layer.addSublayer(drawingLayer)
        }

        //        context.beginPath()
        //        context.move(to: CGPoint(x: 0, y: 0))
        //        context.addLine(to: CGPoint(x: 100, y: 100))
        //        context.addLine(to: CGPoint(x: 200, y: 100))
        //        context.strokePath()
        //
        //        context.beginPath()
        //        context.move(to: CGPoint(x: 0, y: 200))
        //        context.addLine(to: CGPoint(x: 100, y: 300))
        //        context.strokePath()
    }
    
    public func sync(command: String) {
        print("sync command", command, self.commands.count)
        let data = Data(command.utf8)
        
        do {
            // make sure this JSON is in the format we expect
            if let jsonCommands = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                for index in jsonCommands {
                    let jsonCommand = (index)
                    let id = jsonCommand["id"] as? UInt64
                    let cmdType = jsonCommand["cmdType"] as? UInt8
                    let args = jsonCommand["args"] as? [Any]
                    if(id == nil || cmdType == nil || args == nil){
                        continue
                    }
                    let cmd = CanvasCommandStruct(id: id!, cmdType: cmdType!, args: args!)
                    self.commands.append(cmd)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        print("new commands length ", self.commands.count)
        layer.setNeedsDisplay();
    }
}
