
import UIKit

protocol OrdersListSectionProtocol {
    func cellIdentifier(_ viewModel: OrdersListViewModel, indexPath: IndexPath) -> String
    func numberOfRows(_ viewModel: OrdersListViewModel) -> Int
    func headerView(_ viewModel: OrdersListViewModel) -> UIView?
    func headerHeight(_ viewModel: OrdersListViewModel) -> CGFloat
}

class OrdersListSection {
    
    func loadView(_ identifier: String?, height: CGFloat, text: String?, viewModel: OrdersListViewModel) -> UIView? {
        return UIView()
    }
    
}

extension OrdersListSection: OrdersListSectionProtocol {

    func cellIdentifier(_ viewModel: OrdersListViewModel, indexPath: IndexPath) -> String {
        return OrderCell.reuseIdentifier
    }

    func numberOfRows(_ viewModel: OrdersListViewModel) -> Int {
        return viewModel.orders.count
    }

    func headerView(_ viewModel: OrdersListViewModel) -> UIView? {
        return nil
    }

    func headerHeight(_ viewModel: OrdersListViewModel) -> CGFloat {
        return 0.01
    }

}
