
import Foundation
import UIKit

class LoginViewModel {
    
    var showAlert: ((Bool, String)->())?
    var spinner: ((Bool, String)->())?
    
    func placeholder() -> (user: String, pass: String, button: String) {
        return ("loginUserFieldPlaceholder".localized(),
                "loginPassFieldPlaceholder".localized(),
                "loginButtonTitle".localized().uppercased())
    }
    
    func validateForm(_ email: String?, pass: String?) {
        guard let email = email, email.hasContent() else {
            self.showAlert?(false, "loginFormUserError".localized())
            return
        }
        guard email.isValidEmail() else {
            self.showAlert?(false, "loginFormUserError".localized())
            return
        }
        guard let pass = pass, pass.count > 3 else {
            self.showAlert?(false, "loginFormPassError".localized())
            return
        }
        
        self.authenticate(email, pass: pass)
    }
    
    private func authenticate(_ user: String, pass: String) {
        self.spinner?(true, "loginFormLoader".localized())
        
        AuthenticationApi.login(user, pass: pass, success: { auth in
            SessionManager.shared.accessToken = auth.accessToken
            self.spinner?(false, "")
        }) { (code, error, response) in
            self.showAlert?(false, "loginFormApiError".localized())
            self.spinner?(false, "")
        }
    }
    
}
