
import Foundation

class OrdersListApi: Api {
    
    typealias fetchSuccess = (_ ordersList: OrdersListModel) -> Void
    typealias fetchFailure = (_ statusCode: Int?, _ error: Error?, _ response: Any?) -> Void
    
    class func fetch(offset: Int?, limit: Int?, success: @escaping fetchSuccess, failure: @escaping fetchFailure) {
        var components = super.apiComponents()
        components.path += "/v2/orders"
        
        if let offset = offset, let limit = limit {
            let queryOffset = URLQueryItem(name: "offset", value: String(offset))
            let queryLimit = URLQueryItem(name: "limit", value: String(limit))
            components.queryItems = [queryOffset, queryLimit]
        }
        
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
