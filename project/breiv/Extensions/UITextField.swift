
import UIKit

extension UITextField {
    
    enum alignment {
        case left
        case right
    }
    
    enum icon: String {
        case user
        case lock
        case eye
        case eyeHide
    }
    
    func bottomBorder(_ secure: Bool = false) {
        self.tintColor = .white
        self.font = .regular(ofSize: 20)
        self.textColor = .white
        self.textAlignment = .left
        self.borderStyle = .none
        self.keyboardAppearance = .dark
        self.layer.backgroundColor = UIColor.blue.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func setIcon(_ alignment: alignment, image: icon, action: Selector? = nil, target: UIViewController? = nil) {
        let paddingX = alignment == .left ? 0 : 10
        let paddingWidth = alignment == .left ? 34 : 24
        let paddingView = UIView(frame: CGRect(x: paddingX, y: 0, width: paddingWidth, height: 24))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.image = UIImage(named: image.rawValue)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.white.withAlpha(0.5)
        paddingView.addSubview(imageView)
        
        if let action = action, let target = target {
            paddingView.gestureRecognizers?.removeAll()
            let tap = UITapGestureRecognizer(target: target, action: action)
            paddingView.addGestureRecognizer(tap)
        }
        
        switch alignment {
        case .left:
            self.leftView = paddingView
            self.leftViewMode = .always
        case .right:
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
    
}
