
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
    
    func fetchOrders() {
        self.spinner?(true, "loader".localized(.OrdersList))
        
        OrdersListApi.fetch({ ordersList in
            self.ordersList = ordersList
            self.spinner?(false, "")
            self.updateTableView?()
        }) { (code, error, response) in
            self.showAlert?(false, "fetchApiError".localized(.OrdersList), code)
            self.spinner?(false, "")
        }
    }
    
}
