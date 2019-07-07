
import Foundation

class OrderModel: Codable {
    
    var id: String?
    var ownId: String?
    var status: String?
    var createdAt: String?
    var updatedAt: String?
    var amount: AmountModel?
    var customer: CustomerModel?
    var payments: [PaymentModel]?
    
}
