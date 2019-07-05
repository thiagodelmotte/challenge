
import Foundation
import UIKit
import SwiftyDrop

class Alert {
    
    class func banner(_ message: String, state: DropState, duration: Double = 3.0, action: DropAction? = nil) {
        Drop.down(message, state: state, duration: duration, action: action)
    }
    
}
