
import UIKit

class OrdersListSummaryView: UIView {
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    func setup(_ viewModel: OrdersListViewModel) {
        self.descriptionLabel.text = viewModel.summary
        self.initialize()
    }
    
    private func initialize() {
        self.configureViews()
        self.insertViews()
        self.setupConstraints()
    }
    
    private func configureViews() {
        self.backgroundColor = .grayMedium
        
        self.descriptionLabel.font = .medium(ofSize: 17)
        self.descriptionLabel.textColor = .darkText
    }
    
    private func insertViews() {
        self.addSubview(self.descriptionLabel)
    }
    
    private func setupConstraints() {
        self.descriptionLabel
            .centerYAnchor(equalTo: self.centerYAnchor)
            .leadingAnchor(equalTo: self.leadingAnchor, constant: 16)
            .trailingAnchor(equalTo: self.trailingAnchor, constant: -16)
    }
    
}
