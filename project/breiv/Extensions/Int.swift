
import Foundation

extension Int {
    
    func toCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        let number = NSNumber(value: self)
        return formatter.string(from: number)
    }
    
}
