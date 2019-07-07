
import Foundation
import UIKit

class OrdersListViewModel {
    
    private var ordersList: OrdersListModel
    var firstLoad = false
    var pageLoadLess = 3
    var pageLimit = 20
    var isLoading = false
    var eof = false
    
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
    
    var summaryCount: Int {
        return self.ordersList.summary?.count ?? 0
    }
    
    func fetchOrders(reload: Bool = false) {
        guard !self.isLoading else { return }
        self.isLoading = true
        
        if self.firstLoad {
            self.spinner?(true, "loader".localized(.OrdersList))
            self.firstLoad = true
        }
        
        var offset = 0
        
        if !reload {
            offset = self.orders.count
        }
        
        OrdersListApi.fetch(offset: offset, limit: self.pageLimit, success: { [weak self] ordersList in
            if reload {
                self?.eof = false
                self?.ordersList = ordersList
            } else if let orders = ordersList.orders, orders.count > 0 {
                self?.ordersList.orders?.append(contentsOf: orders)
                if let limitTotal = self?.summaryCount, let total = self?.orders.count, total >= limitTotal {
                    self?.eof = true
                }
            }
            
            self?.spinner?(false, "")
            self?.endRefreshing?()
            self?.updateTableView?()
            self?.isLoading = false
        }) { [weak self] (code, error, response) in
            self?.showAlert?(false, "fetchApiError".localized(.OrdersList), code)
            self?.spinner?(false, "")
            self?.endRefreshing?()
            self?.isLoading = false
        }
    }
    
}
