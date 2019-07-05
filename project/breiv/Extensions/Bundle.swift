
import Foundation

extension Bundle {
    
    var endpointBase: URL {
        let endpoint = self.object(forInfoDictionaryKey: "ENDPOINT_BASE") as! String
        return URL(string: endpoint)!
    }
    
    var endpointConnection: URL {
        let endpoint = self.object(forInfoDictionaryKey: "ENDPOINT_CONNECTION") as! String
        return URL(string: endpoint)!
    }
    
    var keyClientSecret: String {
        return self.object(forInfoDictionaryKey: "KEY_CLIENT_SECRET") as! String
    }
    
}
