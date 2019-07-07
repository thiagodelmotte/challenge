
import Foundation
import UIKit

class OrdersListViewModel {
    
    private var ordersList: OrdersListModel
    
    init(ordersList: OrdersListModel = OrdersListModel()) {
        self.ordersList = ordersList
    }
    
    var showAlert: ((Bool, String, Int?)->())?
    var spinner: ((Bool, String)->())?
    var updateTableView: (()->())?
    var endRefreshing: (()->())?
    
    var navigationTitle: String {
        return "navigationTitle".localized(.OrdersList)
    }
    
    var sections: [OrdersListSection] {
        return [OrdersListSection()]
    }
    
    var orders: [OrderViewModel] {
        return self.ordersList.orders?.map {
            OrderViewModel(order: $0)
        } ?? [OrderViewModel]()
    }
    
    var summary: String? {
        let amount = self.ordersList.summary?.amount ?? 0
        let currency = amount.toCurrency() ?? "R$ 0,00"
        let total = String(self.ordersList.summary?.count ?? 0)
        return String(format: "summaryBar".localized(.OrdersList), total, currency)
    }
    
    func fetchOrders(reload: Bool = false) {
        if !reload {
            self.spinner?(true, "loader".localized(.OrdersList))
        }
        
        OrdersListApi.fetch({ [weak self] ordersList in
            self?.ordersList = ordersList
            self?.spinner?(false, "")
            self?.endRefreshing?()
            self?.updateTableView?()
        }) { [weak self] (code, error, response) in
            self?.showAlert?(false, "fetchApiError".localized(.OrdersList), code)
            self?.spinner?(false, "")
            self?.endRefreshing?()
        }
    }
    
}
