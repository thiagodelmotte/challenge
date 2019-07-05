
import UIKit

extension UIFont {
    
    enum robotoFontType: String {
        case regular = "Roboto-Regular"
        case bold = "Roboto-Bold"
        case boldItalic = "Roboto-BoldItalic"
        case black = "Roboto-Black"
        case blackItalic = "Roboto-BlackItalic"
        case italic = "Roboto-Italic"
        case light = "Roboto-Light"
        case lightItalic = "Roboto-LightItalic"
        case medium = "Roboto-Medium"
        case mediumItalic = "Roboto-MediumItalic"
        case thin = "Roboto-Thin"
        case thinItalic = "Roboto-ThinItalic"
    }
    
    static func regular(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .regular, ofSize: ofSize)
    }
    
    static func bold(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .bold, ofSize: ofSize)
    }
    
    static func boldItalic(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .boldItalic, ofSize: ofSize)
    }
    
    static func black(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .black, ofSize: ofSize)
    }
    
    static func blackItalic(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .blackItalic, ofSize: ofSize)
    }
    
    static func italic(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .italic, ofSize: ofSize)
    }
    
    static func light(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .light, ofSize: ofSize)
    }
    
    static func lightItalic(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .lightItalic, ofSize: ofSize)
    }
    
    static func medium(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .medium, ofSize: ofSize)
    }
    
    static func mediumItalic(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .mediumItalic, ofSize: ofSize)
    }
    
    static func thin(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .thin, ofSize: ofSize)
    }
    
    static func thinItalic(ofSize: CGFloat) -> UIFont {
        return self.roboto(type: .thinItalic, ofSize: ofSize)
    }
    
    private static func roboto(type: robotoFontType, ofSize: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
}
