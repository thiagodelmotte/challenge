
import UIKit

extension String {
    
    func localized(_ comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
    
    func generateHash() -> String {
        let charsLowercase = Array("abcdefghijklmnopqrstuvwxyz")
        let charsUppercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let charsNumber = Array("1234567890")
        
        let array = (0 ..< 4).map{ _ in
            [charsLowercase[Int(arc4random_uniform(UInt32(charsLowercase.count)))],
             charsUppercase[Int(arc4random_uniform(UInt32(charsUppercase.count)))],
             charsNumber[Int(arc4random_uniform(UInt32(charsNumber.count)))]].compactMap {$0}
        }
        
        return String(array.flatMap {$0})
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    func hasWhitespaces() -> Bool {
        return self.rangeOfCharacter(from: NSCharacterSet.whitespaces) != nil
    }
    
    func hasContent() -> Bool {
        return self.trim() != ""
    }
    
    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailTest.evaluate(with: self)
    }
    
}
