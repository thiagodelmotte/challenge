
import UIKit

protocol OrdersListSectionProtocol {
    func cellIdentifier(_ viewModel: OrdersListViewModel, indexPath: IndexPath) -> String
    func numberOfRows(_ viewModel: OrdersListViewModel) -> Int
    func headerHeight(_ viewModel: OrdersListViewModel) -> CGFloat
}

class OrdersListSection: OrdersListSectionProtocol {
    
    func cellIdentifier(_ viewModel: OrdersListViewModel, indexPath: IndexPath) -> String {
        return OrderCell.reuseIdentifier
    }
    
    func numberOfRows(_ viewModel: OrdersListViewModel) -> Int {
        return viewModel.orders.count
    }
    
    func headerHeight(_ viewModel: OrdersListViewModel) -> CGFloat {
        return 40.0
    }
    
}
