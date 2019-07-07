
import UIKit

extension UIBarButtonItem {
    
    func logout(_ action: Selector?, target: UIViewController?) -> UIBarButtonItem {
        self.title = "logout".localized(.General)
        self.style = .plain
        self.target = target
        self.action = action
        return self
    }
    
}
