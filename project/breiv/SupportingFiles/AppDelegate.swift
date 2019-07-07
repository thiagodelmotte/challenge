
import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setupRootController()
        self.setupServices()
        return true
    }
    
    private func setupRootController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = SessionManager.shared.isLoggedIn() ? OrdersListCoordinator().start() : LoginViewController()
        self.window?.makeKeyAndVisible()
    }
    
    private func setupServices() {
        IQKeyboardManager.shared.enable = true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
}
