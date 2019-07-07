
import Foundation
import UIKit

class OrderViewModel {
    
    enum OrderStatus: String {
        case reverted
        case paid
        case waiting
        case notPaid = "not_paid"
    }
    
    enum PaymentMethod: String {
        case creditCard = "CREDIT_CARD"
        case debitCard = "DEBIT_CARD"
        case bankSlip = "BOLETO"
    }
    
    private var order: OrderModel
    
    init(order: OrderModel = OrderModel()) {
        self.order = order
    }
    
    var id: String? {
        return self.order.id
    }
    
    var ownId: String? {
        return self.order.ownId
    }
    
    var statusFormatted: String? {
        guard let status = self.order.status else {
            return "--"
        }
        return "orderStatus\(status.capitalized)".localized(.General).uppercased()
    }
    
    var statusColor: UIColor {
        guard let status = self.order.status, let statusEnum = OrderStatus(rawValue: status.lowercased()) else {
            return .lightGray
        }
        
        switch statusEnum {
        case .reverted, .notPaid:
            return .red
        case .paid:
            return .green
        case .waiting:
            return .yellowDark
        }
    }
    
    var updatedAt: String? {
        return self.order.updatedAt?.dateString()
    }
    
    var amount: String? {
        return self.order.amount?.total?.toCurrency()
    }
    
    var customerEmail: String? {
        return self.order.customer?.email
    }
    
    var paymentIcon: String {
        guard let method = self.order.payments?.last?.fundingInstrument?.method,
            let methodEnum = PaymentMethod(rawValue: method) else {
            return "barCode"
        }
        
        switch methodEnum {
        case .creditCard, .debitCard:
            return "creditCard"
        case .bankSlip:
            return "barCode"
        }
    }

}
