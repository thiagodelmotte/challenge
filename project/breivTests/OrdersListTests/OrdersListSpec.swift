
import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import Breiv

class OrdersListSpec: QuickSpec {
    
    override func spec() {
        
        describe("OrderViewModel") {
            var sut: OrderViewModel!
            
            beforeEach {
                
            }
            
            context("when will get status color") {
                it("should paid be green") {
                    let order = OrderModel()
                    order.status = "PAID"
                    sut = OrderViewModel(order: order)
                    expect(sut.statusColor).to(equal(UIColor.green))
                    expect(sut.statusColor).toNot(equal(UIColor.redDark))
                }
                
                xit("should not paid be red") {
                    let order = OrderModel()
                    order.status = "NOT_PAID"
                    sut = OrderViewModel(order: order)
                    expect(sut.statusColor).to(equal(UIColor.red))
                    expect(sut.statusColor).toNot(equal(UIColor.redDark))
                }
                
                xit("should reverted be red") {
                    let order = OrderModel()
                    order.status = "REVERTED"
                    sut = OrderViewModel(order: order)
                    expect(sut.statusColor).to(equal(UIColor.red))
                    expect(sut.statusColor).toNot(equal(UIColor.green))
                }
                
                xit("should waiting be yellow") {
                    let order = OrderModel()
                    order.status = "REVERTED"
                    sut = OrderViewModel(order: order)
                    expect(sut.statusColor).to(equal(UIColor.yellowDark))
                    expect(sut.statusColor).toNot(equal(UIColor.orange))
                }
            }
        }
        
    }
    
}
