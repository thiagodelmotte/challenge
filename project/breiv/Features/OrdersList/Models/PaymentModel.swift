
import Foundation

class PaymentModel: Codable {
    
    var fundingInstrument: FundingInstrumentModel?
    
}

class FundingInstrumentModel: Codable {
    
    var method: String?
    
}
