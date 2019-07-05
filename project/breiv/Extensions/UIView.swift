
import UIKit

extension UIView {
    
    func rounded(_ radius: CGFloat = 0, clipsToBounds: Bool = true) {
        self.layer.cornerRadius = (radius == 0) ? self.bounds.height / 2 : radius
        self.clipsToBounds = clipsToBounds
    }
    
}
