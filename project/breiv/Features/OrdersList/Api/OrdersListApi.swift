
import Foundation

class OrdersListApi: Api {
    
    typealias fetchSuccess = (_ ordersList: OrdersListModel) -> Void
    typealias fetchFailure = (_ statusCode: Int?, _ error: Error?, _ response: Any?) -> Void
    
    class func fetch(_ success: @escaping fetchSuccess, failure: @escaping fetchFailure) {
        var components = super.apiComponents()
        components.path += "/v2/orders"
        
        guard let url = components.url else {
            failure(nil, nil, nil)
            return
        }
        
        super.request(.get, url: url, parameters: nil, success: { (statusCode, response) in
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: response, options: []) {
                if let orders = try? JSONDecoder().decode(OrdersListModel.self, from: jsonData) {
                    success(orders)
                } else {
                    failure(statusCode, nil, nil)
                }
            }
            
        }) { (statusCode, response, error) in
            failure(statusCode, error, response)
        }
    }
    
}
