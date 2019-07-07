
import UIKit

extension UINavigationController {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.blue()
    }
    
    func blue() {
        self.navigationBar.isTranslucent = false
        self.navigationBar.backgroundColor = .blue
        self.navigationBar.barTintColor = .blue
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.medium(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
