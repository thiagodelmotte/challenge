
import Alamofire

class ApiRequest {
    
    private var request: DataRequest!
    
    init(_ request: DataRequest) {
        self.request = request
    }
    
    func cancel() {
        self.request.cancel()
    }
    
}
