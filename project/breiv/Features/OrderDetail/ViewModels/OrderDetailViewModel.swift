

import Foundation
import UIKit

class OrderDetailViewModel {
    
    private var order: OrderModel
    private var orderId: String
    
    var showAlert: ((Bool, String, Int?)->())?
    var spinner: ((Bool, String)->())?
    var updateScreen: (()->())?
    
    var amount: String? {
        return self.order.amount?.total?.toCurrency()
    }
    
    var ownId: String? {
        return self.order.ownId
    }
    
    var lastPaymentType: String? {
        guard let method = self.order.payments?.last?.fundingInstrument?.method else {
            return "--"
        }
        return method.localized(.General)
    }
    
    var id: String? {
        return self.order.id
    }
    
    var customerName: String? {
        return self.order.customer?.fullname
    }
    
    var customerEmail: String? {
        return self.order.customer?.email
    }
    
    var createdAt: String? {
        return self.order.createdAt?.dateString()
    }
    
    var updatedAt: String? {
        return self.order.updatedAt?.dateString()
    }
    
    var statusFormatted: String? {
        let orderVM = OrderViewModel(order: self.order)
        return orderVM.statusFormatted
    }
    
    var statusColor: UIColor {
        let orderVM = OrderViewModel(order: self.order)
        return orderVM.statusColor
    }
    
    var paid: String? {
        return "+ \(self.order.amount?.paid?.toCurrency() ?? "R$ 0,00")"
    }
    
    var fees: String? {
        return "- \(self.order.amount?.fees?.toCurrency() ?? "R$ 0,00")"
    }
    
    var liquid: String? {
        return "= \(self.order.amount?.liquid?.toCurrency() ?? "R$ 0,00")"
    }
    
    var paymentsCount: String? {
        guard let count = self.order.payments?.count else {
            return "--"
        }
        return String(format: "paymentQtd".localized(.OrderDetail), count)
    }
    
    init(order: OrderModel = OrderModel(), orderId: String) {
        self.order = order
        self.orderId = orderId
    }
    
    func fetch() {
        self.spinner?(true, "formLoader".localized(.OrderDetail))
        
        OrderDetailApi.fetch(id: self.orderId, success: { [weak self] order in
            self?.order = order
            self?.updateScreen?()
            self?.spinner?(false, "")
        }) { [weak self] (code, error, response) in
            self?.showAlert?(false, "fetchApiError".localized(.OrderDetail), code)
            self?.spinner?(false, "")
        }
    }
    
}
