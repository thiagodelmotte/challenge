
import Foundation

class AuthenticationApi: Api {
    
    typealias validateSuccess = (_ auth: AuthModel) -> Void
    typealias validateFailure = (_ statusCode: Int?, _ error: Error?, _ response: Any?) -> Void
    
    class func login(_ user: String, pass: String, success: @escaping validateSuccess, failure: @escaping validateFailure) {
        var components = super.apiComponents(type: .connection)
        components.path += "/oauth/token"
        
        guard let url = components.url else {
            failure(nil, nil, nil)
            return
        }
        
        let params: [String : Any] = [
            "client_id": "APP-H1DR0RPHV7SP",
            "client_secret": Bundle.main.keyClientSecret,
            "grant_type": "password",
            "username": user,
            "password": pass,
            "device_id": String().generateHash(),
            "scope": "APP_ADMIN"
        ]
        
        super.request(.post, url: url, parameters: params, success: { (statusCode, response) in
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: response, options: []) {
                if let auth = try? JSONDecoder().decode(AuthModel.self, from: jsonData) {
                    success(auth)
                } else {
                    failure(statusCode, nil, nil)
                }
            }
            
        }) { (statusCode, response, error) in
            failure(statusCode, error, response)
        }
    }
    
}
