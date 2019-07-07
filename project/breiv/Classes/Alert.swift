
import Foundation
import UIKit
import SwiftyDrop

class Alert {
    
    class func banner(_ message: String, state: DropState, duration: Double = 3.0, action: DropAction? = nil, statusCode: Int? = nil) {
        var msg = message
        
        if let code = statusCode, let codeEnum = Api.statusCodes(rawValue: code), codeEnum == .disconnected {
            msg = "noInternetMessage".localized(.General)
        }
        
        Drop.down(msg, state: state, duration: duration, action: action)
    }
    
}
