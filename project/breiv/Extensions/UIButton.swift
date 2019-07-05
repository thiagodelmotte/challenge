
import UIKit

extension UIButton {
    
    func colorRounded(_ color: UIColor, textColor: UIColor? = nil) {
        self.setTitleColor(textColor ?? .white, for: .normal)
        self.titleLabel?.font = .regular(ofSize: 16)
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = color
        self.rounded(10)
    }
    
}
