
import UIKit

class OrderCell: UITableViewCell, Reusable {
    
    lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 6.0
        return label
    }()
    
    lazy var transactionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var accessoryIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    func setup(_ viewModel: OrderViewModel) {
        self.icon.image = UIImage(named: viewModel.paymentIcon)?.withRenderingMode(.alwaysTemplate)
        self.amountLabel.text = viewModel.amount
        self.dateLabel.text = viewModel.updatedAt
        self.emailLabel.text = viewModel.customerEmail
        self.statusLabel.text = viewModel.statusFormatted
        self.statusLabel.textColor = viewModel.statusColor
        self.statusLabel.layer.borderColor = viewModel.statusColor.cgColor
        self.transactionLabel.text = viewModel.ownId
        
        self.initialize()
    }
    
    private func initialize() {
        self.configureViews()
        self.insertViews()
        self.setupConstraints()
    }
    
    private func configureViews() {
        self.icon.tintColor = .lightGray
        
        self.amountLabel.font = .medium(ofSize: 18)
        self.amountLabel.textColor = .blue
        
        self.dateLabel.font = .regular(ofSize: 18)
        self.dateLabel.textColor = .darkGray
        
        self.emailLabel.font = .regular(ofSize: 13)
        self.emailLabel.textColor = .darkGray
        
        self.statusLabel.font = .regular(ofSize: 13)
        
        self.transactionLabel.font = .regular(ofSize: 12)
        self.transactionLabel.textColor = .lightGray
        
        self.accessoryIcon.tintColor = .lightGray
        self.accessoryIcon.image = UIImage(named: "arrowRight")?.withRenderingMode(.alwaysTemplate)
    }
    
    private func insertViews() {
        self.contentView.addSubview(self.icon)
        self.contentView.addSubview(self.amountLabel)
        self.contentView.addSubview(self.dateLabel)
        self.contentView.addSubview(self.emailLabel)
        self.contentView.addSubview(self.statusLabel)
        self.contentView.addSubview(self.transactionLabel)
        self.contentView.addSubview(self.accessoryIcon)
    }
    
    private func setupConstraints() {
        self.icon
            .centerYAnchor(equalTo: self.contentView.centerYAnchor)
            .leadingAnchor(equalTo: self.contentView.leadingAnchor, constant: 16)
            .widthAnchor(equalTo: 30)
            .heightAnchor(equalTo: 20)
        
        self.amountLabel
            .topAnchor(equalTo: self.contentView.topAnchor, constant: 16)
            .leadingAnchor(equalTo: self.icon.trailingAnchor, constant: 10)
        
        self.dateLabel
            .topAnchor(equalTo: self.contentView.topAnchor, constant: 16)
            .leadingAnchor(equalTo: self.amountLabel.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.accessoryIcon.leadingAnchor, constant: -16)
            .widthAnchor(equalTo: 70)
        
        self.emailLabel
            .topAnchor(equalTo: self.amountLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.icon.trailingAnchor, constant: 10)
        
        self.statusLabel
            .topAnchor(equalTo: self.amountLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.emailLabel.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.accessoryIcon.leadingAnchor, constant: -16)
            .widthAnchor(equalTo: 100)
        
        self.transactionLabel
            .topAnchor(equalTo: self.emailLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.icon.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.accessoryIcon.leadingAnchor, constant: -16)
            .bottomAnchor(equalTo: self.contentView.bottomAnchor, constant: -16)
        
        self.accessoryIcon
            .centerYAnchor(equalTo: self.contentView.centerYAnchor)
            .trailingAnchor(equalTo: self.contentView.trailingAnchor, constant: -16)
            .widthAnchor(equalTo: 15)
            .heightAnchor(equalTo: 15)
    }
    
}
