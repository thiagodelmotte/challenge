
import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import Breiv

class LoginSpec: QuickSpec {
    
    override func spec() {
        
        context("LoginViewControllerSpec") {
            var sut: LoginViewController!
            
            beforeEach {
                sut = LoginViewController()
                WindowHelper.showInTestWindow(viewController: sut)
            }
            
            describe("Layout") {
                it("should match snapshot") {
                    expect(sut) == snapshot("LoginViewController")
                }
            }
        }
        
        context("LoginViewModelSpec") {
            describe("SessionManager") {
                it("should be nil at startup") {
                    _ = AuthModel().delete()
                    let accessToken = SessionManager.shared.accessToken
                    expect(accessToken).to(beNil())
                    SessionManager.shared.accessToken = "j2krkj3h23j4kh324kljh3dfd"
                }
                
                it("should keep access token saved") {
                    let accessToken = SessionManager.shared.accessToken
                    expect(accessToken).to(equal("j2krkj3h23j4kh324kljh3dfd"))
                    expect(accessToken).toNot(equal("ptjtopyrthkropkthpertojh"))
                    expect(accessToken).toNot(beNil())
                }
            }
        }
        
    }
    
}
