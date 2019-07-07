
import Foundation
import UIKit

class LoginViewModel {
    
    var showAlert: ((Bool, String, Int?)->())?
    var spinner: ((Bool, String)->())?
    var goToOrdersList: (()->())?
    
    func placeholder() -> (user: String, pass: String, button: String) {
        return ("userFieldPlaceholder".localized(.Login),
                "passFieldPlaceholder".localized(.Login),
                "buttonTitle".localized(.Login).uppercased())
    }
    
    func proceedToSignin(_ email: String?, pass: String?) {
        if self.validateForm(email, pass: pass) {
            guard let email = email, let pass = pass else { return }
            self.authenticate(email, pass: pass)
        }
    }
    
    func validateForm(_ email: String?, pass: String?) -> Bool {
        guard let email = email, email.hasContent() else {
            self.showAlert?(false, "formUserError".localized(.Login), nil)
            return false
        }
        guard email.isValidEmail() else {
            self.showAlert?(false, "formUserError".localized(.Login), nil)
            return false
        }
        guard let pass = pass, pass.count > 3 else {
            self.showAlert?(false, "formPassError".localized(.Login), nil)
            return false
        }
        
        return true
    }
    
    private func authenticate(_ user: String, pass: String) {
        self.spinner?(true, "formLoader".localized(.Login))
        
        AuthenticationApi.login(user, pass: pass, success: { [weak self] auth in
            SessionManager.shared.accessToken = auth.accessToken
            self?.spinner?(false, "")
            self?.goToOrdersList?()
        }) { [weak self] (code, error, response) in
            self?.showAlert?(false, "formApiError".localized(.Login), code)
            self?.spinner?(false, "")
        }
    }
    
}
