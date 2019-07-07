
import Foundation

class OrderDetailApi: Api {
    
    typealias fetchSuccess = (_ order: OrderModel) -> Void
    typealias fetchFailure = (_ statusCode: Int?, _ error: Error?, _ response: Any?) -> Void
    
    class func fetch(id: String, success: @escaping fetchSuccess, failure: @escaping fetchFailure) {
        var components = super.apiComponents()
        components.path += "/v2/orders/\(id)"
        
        guard let url = components.url else {
            failure(nil, nil, nil)
            return
        }
        
        super.request(.get, url: url, parameters: nil, success: { (statusCode, response) in
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: response, options: []) {
                if let order = try? JSONDecoder().decode(OrderModel.self, from: jsonData) {
                    success(order)
                } else {
                    failure(statusCode, nil, nil)
                }
            }
            
        }) { (statusCode, response, error) in
            failure(statusCode, error, response)
        }
    }
    
}
