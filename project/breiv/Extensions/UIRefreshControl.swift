
import Foundation
import UIKit

extension UIRefreshControl {
    
    func standard(_ target: Any, action: Selector) {
        self.addTarget(target, action: action, for: .valueChanged)
        self.tintColor = .blue
        self.bounds.origin = CGPoint(x: 0.0, y: -20.0)
    }
    
}
