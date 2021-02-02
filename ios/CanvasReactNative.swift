import Foundation
import UIKit

@objc(CanvasReactNative)
class CanvasReactNative: RCTViewManager {
    var canvas: Canvas!
    override func view() -> UIView! {
        canvas = Canvas()
        canvas.backgroundColor = UIColor.blue
        return canvas
    }

    override static func requiresMainQueueSetup() -> Bool {
        return true
    }

     @objc public func sync(_ node:NSNumber, command:NSString){
         DispatchQueue.main.sync {
            canvas.sync(command: command)
         }
     }
}
