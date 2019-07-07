
import Foundation
import UIKit

class SessionManager {
    
    static let shared = SessionManager()
    
    var accessToken: String? {
        get {
            if let auth = AuthModel().get() {
                return auth.accessToken
            }
            return nil
        }
        set(value) {
            guard let accessToken = value else { return }
            let auth = AuthModel()
            auth.accessToken = accessToken
            _ = auth.save()
        }
    }
    
    func isLoggedIn() -> Bool {
        return self.accessToken != nil
    }
    
    func logout() {
        _ = AuthModel().delete()
        self.accessToken = nil
        UIApplication.shared.keyWindow?.rootViewController = LoginViewController()
    }
    
}
