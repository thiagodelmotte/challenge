
import UIKit

class WindowHelper {
    
    static var testWindow: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        return window
    }()
    
    static func showInTestWindow(viewController: UIViewController) {
        WindowHelper.testWindow.rootViewController = viewController
        WindowHelper.testWindow.makeKeyAndVisible()
    }
}
