
import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import Breiv

class LoginUISpec: QuickSpec {
    
    override func spec() {
        
        describe("LoginViewController") {
            var sut: LoginViewController!
            
            beforeEach {
                SessionManager.shared.accessToken = nil
                sut = LoginViewController()
                WindowHelper.showInTestWindow(viewController: sut)
            }
            
            context("when screen loads") {
                it("should match snapshot") {
                    expect(sut) == snapshot("LoginViewController")
                }
            }
            
            context("when screen loads") {
                it("should fill form and login") {
                    self.viewTester.usingIdentifier("fieldEmail")?.waitForView()
                    self.tester.enterText("moip-test-developer@moip.com.br", intoViewWithAccessibilityLabel: "fieldEmail")
                    self.tester.enterText("testemoip123", intoViewWithAccessibilityLabel: "fieldPass")
                    self.viewTester.usingIdentifier("signinButton")?.tap()
                    self.viewTester.usingLabel("formLoader".localized(.Login))?.waitForView()
                }
            }
        }
        
    }
    
}
