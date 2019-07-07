
import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import Breiv

class LoginSpec: QuickSpec {
    
    override func spec() {
        
        describe("LoginViewModel") {
            context("when it is first load") {
                it("should accessToken be nil and save it") {
                    _ = AuthModel().delete()
                    let accessToken = SessionManager.shared.accessToken
                    expect(accessToken).to(beNil())
                    SessionManager.shared.accessToken = "j2krkj3h23j4kh324kljh3dfd"
                }
            }

            context("when it is not first load") {
                it("should keep access token saved") {
                    let accessToken = SessionManager.shared.accessToken
                    expect(accessToken).to(equal("j2krkj3h23j4kh324kljh3dfd"))
                    expect(accessToken).toNot(equal("ptjtopyrthkropkthpertojh"))
                    expect(accessToken).toNot(beNil())
                }
            }

            context("when validate login form") {
                it("should validate email") {
                    expect(LoginViewModel().validateForm("", pass: "1234")).toNot(beTrue())
                    expect(LoginViewModel().validateForm(" ", pass: "1234")).toNot(beTrue())
                    expect(LoginViewModel().validateForm("teste", pass: "1234")).toNot(beTrue())
                    expect(LoginViewModel().validateForm("teste@teste", pass: "1234")).toNot(beTrue())
                    expect(LoginViewModel().validateForm("teste@teste.com.br", pass: "1234")).to(beTrue())
                }

                it("should validate password") {
                    expect(LoginViewModel().validateForm("teste@teste.com.br", pass: "")).toNot(beTrue())
                    expect(LoginViewModel().validateForm("teste@teste.com.br", pass: " ")).toNot(beTrue())
                    expect(LoginViewModel().validateForm("teste@teste.com.br", pass: "a")).toNot(beTrue())
                    expect(LoginViewModel().validateForm("teste@teste.com.br", pass: "156")).toNot(beTrue())
                    expect(LoginViewModel().validateForm("teste@teste.com.br", pass: "1234")).to(beTrue())
                }
            }
        }
        
    }
    
}
