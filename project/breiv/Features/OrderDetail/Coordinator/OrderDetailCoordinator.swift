
import Foundation
import UIKit

class OrderDetailCoordinator {
    
    private var orderId: String
    
    init(with id: String) {
        self.orderId = id
    }
    
    func start() -> UIViewController {
        let orderDetailVM = OrderDetailViewModel(orderId: self.orderId)
        return OrderDetailViewController(viewModel: orderDetailVM)
    }
    
}
