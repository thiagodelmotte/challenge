
import UIKit

class LoginViewController: UIViewController {
    
    private var viewModel = LoginViewModel()
    private var eyePassType: UITextField.icon = .eye
    
    lazy var logo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.alpha = 0.0
        return image
    }()
    
    lazy var userField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocapitalizationType = .none
        field.keyboardType = .emailAddress
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.text = "moip-test-developer@moip.com.br" // Testing...
        return field
    }()
    
    lazy var passField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.isSecureTextEntry = true
        field.text = "testemoip123" // Testing...
        return field
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        self.initViewModel()
    }
    
    private func initialize() {
        self.configureViews()
        self.insertViews()
        self.setupConstraints()
    }
    
    private func initViewModel() {
        self.viewModel.showAlert = { success, message in
            DispatchQueue.main.async {
                Alert.banner(message, state: success ? .success : .error)
            }
        }
        
        self.viewModel.spinner = { (show, message) in
            DispatchQueue.main.async {
                guard show else {
                    Spinner.hide()
                    return
                }
                Spinner.show(message)
            }
        }
    }
    
    private func configureViews() {
        let placeholder = self.viewModel.placeholder()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .blue
        
        self.logo.image = UIImage(named: "logo-breiv")
        UIView.animate(withDuration: 0.5) {
            self.logo.alpha = 1.0
        }
        
        self.userField.attributedPlaceholder = NSAttributedString(string: placeholder.user, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlpha(0.5)])
        self.userField.bottomBorder()
        self.userField.setIcon(.left, image: .user)
        
        self.passField.attributedPlaceholder = NSAttributedString(string: placeholder.pass, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlpha(0.5)])
        self.passField.bottomBorder()
        self.passField.setIcon(.left, image: .lock)
        self.passField.setIcon(.right, image: .eye, action: #selector(self.eyePass), target: self)
        
        self.button.setTitle(placeholder.button, for: .normal)
        self.button.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        self.button.colorRounded(.darkBlue)
    }
    
    private func insertViews() {
        self.view.addSubview(self.logo)
        self.view.addSubview(self.userField)
        self.view.addSubview(self.passField)
        self.view.addSubview(self.button)
    }
    
    private func setupConstraints() {
        self.logo
            .topAnchor(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50)
            .centerXAnchor(equalTo: self.view.centerXAnchor)
            .widthAnchor(equalTo: 200)
            .heightAnchor(equalTo: 200)
        
        self.userField
            .topAnchor(equalTo: self.logo.bottomAnchor, constant: 50)
            .leadingAnchor(equalTo: self.view.leadingAnchor, constant: 38)
            .trailingAnchor(equalTo: self.view.trailingAnchor, constant: -38)
            .heightAnchor(equalTo: 50)
        
        self.passField
            .topAnchor(equalTo: self.userField.bottomAnchor, constant: 15)
            .leadingAnchor(equalTo: self.view.leadingAnchor, constant: 38)
            .trailingAnchor(equalTo: self.view.trailingAnchor, constant: -38)
            .heightAnchor(equalTo: 50)
        
        self.button
            .topAnchor(equalTo: self.passField.bottomAnchor, constant: 40)
            .leadingAnchor(equalTo: self.view.leadingAnchor, constant: 38)
            .trailingAnchor(equalTo: self.view.trailingAnchor, constant: -38)
            .heightAnchor(equalTo: 50)
    }
    
    @objc private func login() {
        self.passField.isSecureTextEntry = true
        self.viewModel.validateForm(self.userField.text, pass: self.passField.text)
    }
    
    @objc private func eyePass() {
        let icon: UITextField.icon = (self.eyePassType == .eye) ? .eyeHide : .eye
        self.eyePassType = icon
        self.passField.setIcon(.right, image: icon, action: #selector(self.eyePass), target: self)
        self.passField.isSecureTextEntry = !self.passField.isSecureTextEntry
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
