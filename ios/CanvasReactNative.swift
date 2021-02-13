import Foundation
import UIKit

@objc(CanvasReactNative)
class CanvasReactNative: RCTViewManager {
    var canvas: Canvas!
    override func view() -> UIView! {
        canvas = Canvas()
        canvas.backgroundColor = UIColor.white
        return canvas
    }

    override static func requiresMainQueueSetup() -> Bool {
        return true
    }

     @objc public func sync(_ node:NSNumber, command:String){
         DispatchQueue.main.sync {
            canvas.sync(command: command)
         }
     }
}
