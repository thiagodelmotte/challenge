
import UIKit

class OrderDetailViewController: UIViewController {
    
    private var viewModel: OrderDetailViewModel
    
    // MARK: - STRUCTURE
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 0
        return stack
    }()
    
    lazy var statusStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 0
        return stack
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - BASIC CONTAINER
    
    lazy var basicInfoContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var transactionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .right
        return label
    }()
    
    lazy var operationTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - CUSTOMER CONTAINER
    
    lazy var customerDataContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var customerIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var customerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var customerNickLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var customerEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var customerBottomLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - STATUS LEFT CONTAINER
    
    lazy var statusLeftContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var statusDateIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var statusDateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var statusDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var statusVerticalLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - STATUS RIGHT CONTAINER
    
    lazy var statusRightContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var statusTypeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var statusUpdatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .right
        return label
    }()
    
    lazy var statusFlagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 6.0
        return label
    }()
    
    // MARK: - BILL CONTAINER
    
    lazy var billContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var billTopLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var billIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var billTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var billTotalTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var billTotalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .right
        return label
    }()
    
    lazy var billTaxTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var billTaxLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .right
        return label
    }()
    
    lazy var billNetTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var billNetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - PAYMENT CONTAINER
    
    lazy var paymentContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var paymentTopLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var paymentIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var paymentTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var paymentQtdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    // MARK: - METHODS
    
    init(viewModel: OrderDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        self.initViewModel()
        self.viewModel.fetch()
    }
    
    private func initialize() {
        self.configureViews()
        self.insertViews()
        self.setupConstraints()
    }
    
    private func initViewModel() {
        self.viewModel.showAlert = { success, message, statusCode in
            DispatchQueue.main.async {
                Alert.banner(message, state: success ? .success : .error, statusCode: statusCode)
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
        
        self.viewModel.updateScreen = {
            DispatchQueue.main.async {
                self.initialize()
            }
        }
    }
    
    // MARK: - CONFIGURE VIEWS
    
    private func configureViews() {
        self.view.backgroundColor = .white
        
        self.configureBasicInfoContainer()
        self.configureCustomerContainer()
        self.configureStatusContainer()
        self.configureBillContainer()
        self.configurePaymentContainer()
    }
    
    private func configureBasicInfoContainer() {
        self.basicInfoContainer.backgroundColor = .grayMedium
        
        self.amountLabel.text = self.viewModel.amount
        self.amountLabel.font = .medium(ofSize: 18)
        self.amountLabel.textColor = .blue
        
        self.transactionLabel.text = self.viewModel.ownId
        self.transactionLabel.font = .regular(ofSize: 12)
        self.transactionLabel.textColor = .darkGray
        
        self.operationTypeLabel.text = self.viewModel.lastPaymentType
        self.operationTypeLabel.font = .regular(ofSize: 13)
        self.operationTypeLabel.textColor = .darkGray
        
        self.idLabel.text = self.viewModel.id
        self.idLabel.font = .regular(ofSize: 12)
        self.idLabel.textColor = .darkGray
    }
    
    private func configureCustomerContainer() {
        self.customerIcon.image = UIImage(named: "headMoney")?.withRenderingMode(.alwaysTemplate)
        self.customerIcon.tintColor = .lightGray
        
        self.customerTitleLabel.text = "buyerTitle".localized(.OrderDetail)
        self.customerTitleLabel.font = .medium(ofSize: 13)
        self.customerTitleLabel.textColor = .lightGray
        
        self.customerNickLabel.text = self.viewModel.customerName
        self.customerNickLabel.font = .regular(ofSize: 13)
        self.customerNickLabel.textColor = .darkGray
        
        self.customerEmailLabel.text = self.viewModel.customerEmail
        self.customerEmailLabel.font = .regular(ofSize: 13)
        self.customerEmailLabel.textColor = .darkGray
        
        self.customerBottomLineView.backgroundColor = .lightGray
    }
    
    private func configureStatusContainer() {
        self.statusDateIcon.image = UIImage(named: "calendar")?.withRenderingMode(.alwaysTemplate)
        self.statusDateIcon.tintColor = .lightGray
        
        self.statusDateTitleLabel.text = "statusDateTitle".localized(.OrderDetail)
        self.statusDateTitleLabel.font = .medium(ofSize: 13)
        self.statusDateTitleLabel.textColor = .lightGray
        
        self.statusDateLabel.text = self.viewModel.createdAt
        self.statusDateLabel.font = .regular(ofSize: 13)
        self.statusDateLabel.textColor = .darkGray
        
        self.statusVerticalLineView.backgroundColor = .lightGray
        
        self.statusTypeTitleLabel.text = "statusUpdatedTitle".localized(.OrderDetail)
        self.statusTypeTitleLabel.font = .medium(ofSize: 13)
        self.statusTypeTitleLabel.textColor = .lightGray
        
        self.statusUpdatedLabel.text = self.viewModel.updatedAt
        self.statusUpdatedLabel.font = .regular(ofSize: 13)
        self.statusUpdatedLabel.textColor = .darkGray
        
        self.statusFlagLabel.text = self.viewModel.statusFormatted
        self.statusFlagLabel.font = .regular(ofSize: 13)
        self.statusFlagLabel.textColor = self.viewModel.statusColor
        self.statusFlagLabel.layer.borderColor = self.viewModel.statusColor.cgColor
    }
    
    private func configureBillContainer() {
        self.billTopLineView.backgroundColor = .lightGray
        
        self.billIcon.image = UIImage(named: "coin")?.withRenderingMode(.alwaysTemplate)
        self.billIcon.tintColor = .lightGray
        
        self.billTitleLabel.text = "billTitle".localized(.OrderDetail)
        self.billTitleLabel.font = .medium(ofSize: 13)
        self.billTitleLabel.textColor = .lightGray
        
        self.billTotalTitleLabel.text = "billTotalTitle".localized(.OrderDetail)
        self.billTotalTitleLabel.font = .regular(ofSize: 13)
        self.billTotalTitleLabel.textColor = .darkGray
        
        self.billTotalLabel.text = self.viewModel.paid
        self.billTotalLabel.font = .regular(ofSize: 13)
        self.billTotalLabel.textColor = .darkGray
        
        self.billTaxTitleLabel.text = "billTaxTitle".localized(.OrderDetail)
        self.billTaxTitleLabel.font = .regular(ofSize: 13)
        self.billTaxTitleLabel.textColor = .darkGray
        
        self.billTaxLabel.text = self.viewModel.fees
        self.billTaxLabel.font = .regular(ofSize: 13)
        self.billTaxLabel.textColor = .red
        
        self.billNetTitleLabel.text = "billNetTitle".localized(.OrderDetail)
        self.billNetTitleLabel.font = .regular(ofSize: 13)
        self.billNetTitleLabel.textColor = .darkGray
        
        self.billNetLabel.text = self.viewModel.liquid
        self.billNetLabel.font = .regular(ofSize: 13)
        self.billNetLabel.textColor = .darkGray
    }
    
    private func configurePaymentContainer() {
        self.paymentTopLineView.backgroundColor = .lightGray
        
        self.paymentIcon.image = UIImage(named: "pay")?.withRenderingMode(.alwaysTemplate)
        self.paymentIcon.tintColor = .lightGray
        
        self.paymentTitleLabel.text = "paymentTitle".localized(.OrderDetail)
        self.paymentTitleLabel.font = .medium(ofSize: 13)
        self.paymentTitleLabel.textColor = .lightGray
        
        self.paymentQtdLabel.text = self.viewModel.paymentsCount
        self.paymentQtdLabel.font = .regular(ofSize: 13)
        self.paymentQtdLabel.textColor = .darkGray
    }
    
    // MARK: - ADD VIEWS
    
    private func insertViews() {
        self.basicInfoContainer.addSubview(self.amountLabel)
        self.basicInfoContainer.addSubview(self.transactionLabel)
        self.basicInfoContainer.addSubview(self.operationTypeLabel)
        self.basicInfoContainer.addSubview(self.idLabel)
        self.stackView.addArrangedSubview(self.basicInfoContainer)
        
        self.customerDataContainer.addSubview(self.customerIcon)
        self.customerDataContainer.addSubview(self.customerTitleLabel)
        self.customerDataContainer.addSubview(self.customerNickLabel)
        self.customerDataContainer.addSubview(self.customerEmailLabel)
        self.customerDataContainer.addSubview(self.customerBottomLineView)
        self.stackView.addArrangedSubview(self.customerDataContainer)
        
        self.statusLeftContainer.addSubview(self.statusDateIcon)
        self.statusLeftContainer.addSubview(self.statusDateTitleLabel)
        self.statusLeftContainer.addSubview(self.statusDateLabel)
        self.statusLeftContainer.addSubview(self.statusVerticalLineView)
        self.statusStackView.addArrangedSubview(self.statusLeftContainer)
        
        self.statusRightContainer.addSubview(self.statusTypeTitleLabel)
        self.statusRightContainer.addSubview(self.statusUpdatedLabel)
        self.statusRightContainer.addSubview(self.statusFlagLabel)
        self.statusStackView.addArrangedSubview(self.statusRightContainer)
        
        self.stackView.addArrangedSubview(self.statusStackView)
        
        self.billContainer.addSubview(self.billTopLineView)
        self.billContainer.addSubview(self.billIcon)
        self.billContainer.addSubview(self.billTitleLabel)
        self.billContainer.addSubview(self.billTotalTitleLabel)
        self.billContainer.addSubview(self.billTotalLabel)
        self.billContainer.addSubview(self.billTaxTitleLabel)
        self.billContainer.addSubview(self.billTaxLabel)
        self.billContainer.addSubview(self.billNetTitleLabel)
        self.billContainer.addSubview(self.billNetLabel)
        self.stackView.addArrangedSubview(self.billContainer)
        
        self.paymentContainer.addSubview(self.paymentTopLineView)
        self.paymentContainer.addSubview(self.paymentIcon)
        self.paymentContainer.addSubview(self.paymentTitleLabel)
        self.paymentContainer.addSubview(self.paymentQtdLabel)
        self.stackView.addArrangedSubview(self.paymentContainer)
        
        self.scrollView.addSubview(self.stackView)
        self.view.addSubview(self.scrollView)
    }
    
    // MARK: - SETUP CONSTRAINTS
    
    private func setupConstraints() {
        self.scrollView
            .topAnchor(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            .leadingAnchor(equalTo: self.view.leadingAnchor)
            .trailingAnchor(equalTo: self.view.trailingAnchor)
            .bottomAnchor(equalTo: self.view.bottomAnchor)
        
        self.stackView
            .topAnchor(equalTo: self.scrollView.topAnchor)
            .leadingAnchor(equalTo: self.scrollView.leadingAnchor)
            .trailingAnchor(equalTo: self.scrollView.trailingAnchor)
            .bottomAnchor(equalTo: self.scrollView.bottomAnchor)
        
        self.setupBasicContainerConstraints()
        self.setupCustomerContainerConstraints()
        self.setupStatusLeftContainerConstraints()
        self.setupStatusRightContainerConstraints()
        self.setupBillContainerConstraints()
        self.setupPaymentContainerConstraints()
    }
    
    private func setupBasicContainerConstraints() {
        self.basicInfoContainer
            .widthAnchor(equalTo: self.view.widthAnchor)
        
        self.amountLabel
            .topAnchor(equalTo: self.basicInfoContainer.topAnchor, constant: 16)
            .leadingAnchor(equalTo: self.basicInfoContainer.leadingAnchor, constant: 16)
            .widthAnchor(equalTo: 130)
        
        self.transactionLabel
            .topAnchor(equalTo: self.basicInfoContainer.topAnchor, constant: 16)
            .leadingAnchor(equalTo: self.amountLabel.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.basicInfoContainer.trailingAnchor, constant: -16)
        
        self.operationTypeLabel
            .topAnchor(equalTo: self.amountLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.basicInfoContainer.leadingAnchor, constant: 16)
            .widthAnchor(equalTo: 130)
        
        self.idLabel
            .topAnchor(equalTo: self.amountLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.operationTypeLabel.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.basicInfoContainer.trailingAnchor, constant: -16)
            .bottomAnchor(equalTo: self.basicInfoContainer.bottomAnchor, constant: -16)
    }
    
    private func setupCustomerContainerConstraints() {
        self.customerDataContainer
            .widthAnchor(equalTo: self.view.widthAnchor)
        
        self.customerIcon
            .topAnchor(equalTo: self.customerDataContainer.topAnchor, constant: 16)
            .leadingAnchor(equalTo: self.customerDataContainer.leadingAnchor, constant: 16)
            .widthAnchor(equalTo: 30)
            .heightAnchor(equalTo: 30)
        
        self.customerTitleLabel
            .topAnchor(equalTo: self.customerDataContainer.topAnchor, constant: 16)
            .leadingAnchor(equalTo: self.customerIcon.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.customerDataContainer.trailingAnchor, constant: -16)
        
        self.customerNickLabel
            .topAnchor(equalTo: self.customerTitleLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.customerIcon.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.customerDataContainer.trailingAnchor, constant: -16)
        
        self.customerEmailLabel
            .topAnchor(equalTo: self.customerNickLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.customerIcon.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.customerDataContainer.trailingAnchor, constant: -16)
        
        self.customerBottomLineView
            .topAnchor(equalTo: self.customerEmailLabel.bottomAnchor, constant: 10)
            .leadingAnchor(equalTo: self.customerDataContainer.leadingAnchor, constant: 16)
            .trailingAnchor(equalTo: self.customerDataContainer.trailingAnchor, constant: -16)
            .bottomAnchor(equalTo: self.customerDataContainer.bottomAnchor)
            .heightAnchor(equalTo: 1.0)
    }
    
    private func setupStatusLeftContainerConstraints() {
        self.statusLeftContainer
            .widthAnchor(equalTo: self.view.widthAnchor, multiplier: 0.5)
        
        self.statusDateIcon
            .topAnchor(equalTo: self.statusLeftContainer.topAnchor, constant: 16)
            .leadingAnchor(equalTo: self.statusLeftContainer.leadingAnchor, constant: 16)
            .widthAnchor(equalTo: 30)
            .heightAnchor(equalTo: 30)
        
        self.statusDateTitleLabel
            .topAnchor(equalTo: self.statusLeftContainer.topAnchor, constant: 16)
            .leadingAnchor(equalTo: self.statusDateIcon.trailingAnchor, constant: 10)
        
        self.statusDateLabel
            .topAnchor(equalTo: self.statusDateTitleLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.statusDateIcon.trailingAnchor, constant: 10)
            .bottomAnchor(equalTo: self.statusLeftContainer.bottomAnchor, constant: -16)
        
        self.statusVerticalLineView
            .topAnchor(equalTo: self.statusLeftContainer.topAnchor, constant: 16)
            .trailingAnchor(equalTo: self.statusLeftContainer.trailingAnchor)
            .bottomAnchor(equalTo: self.statusLeftContainer.bottomAnchor, constant: -16)
            .widthAnchor(equalTo: 1.0)
    }
    
    private func setupStatusRightContainerConstraints() {
        self.statusRightContainer
            .widthAnchor(equalTo: self.statusLeftContainer.widthAnchor)
        
        self.statusTypeTitleLabel
            .topAnchor(equalTo: self.statusRightContainer.topAnchor, constant: 16)
            .leadingAnchor(equalTo: self.statusRightContainer.leadingAnchor, constant: 16)
            .widthAnchor(equalTo: 70)
        
        self.statusUpdatedLabel
            .topAnchor(equalTo: self.statusRightContainer.topAnchor, constant: 16)
            .leadingAnchor(equalTo: self.statusTypeTitleLabel.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.statusRightContainer.trailingAnchor, constant: -16)
        
        self.statusFlagLabel
            .topAnchor(equalTo: self.statusUpdatedLabel.bottomAnchor, constant: 4)
            .centerXAnchor(equalTo: self.statusRightContainer.centerXAnchor)
            .bottomAnchor(equalTo: self.statusRightContainer.bottomAnchor, constant: -16)
            .widthAnchor(equalTo: 100)
    }
    
    private func setupBillContainerConstraints() {
        self.billContainer
            .widthAnchor(equalTo: self.view.widthAnchor)
        
        self.billTopLineView
            .topAnchor(equalTo: self.billContainer.topAnchor)
            .leadingAnchor(equalTo: self.billContainer.leadingAnchor, constant: 16)
            .trailingAnchor(equalTo: self.billContainer.trailingAnchor, constant: -16)
            .heightAnchor(equalTo: 1.0)
        
        self.billIcon
            .topAnchor(equalTo: self.billTopLineView.bottomAnchor, constant: 16)
            .leadingAnchor(equalTo: self.billContainer.leadingAnchor, constant: 16)
            .widthAnchor(equalTo: 30)
            .heightAnchor(equalTo: 30)
        
        self.billTitleLabel
            .topAnchor(equalTo: self.billTopLineView.bottomAnchor, constant: 16)
            .leadingAnchor(equalTo: self.billIcon.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.billContainer.trailingAnchor, constant: -16)
        
        self.billTotalTitleLabel
            .topAnchor(equalTo: self.billTitleLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.billIcon.trailingAnchor, constant: 10)
        
        self.billTotalLabel
            .topAnchor(equalTo: self.billTitleLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.billTotalTitleLabel.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.billContainer.trailingAnchor, constant: -16)
        
        self.billTaxTitleLabel
            .topAnchor(equalTo: self.billTotalTitleLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.billIcon.trailingAnchor, constant: 10)
        
        self.billTaxLabel
            .topAnchor(equalTo: self.billTotalLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.billTaxTitleLabel.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.billContainer.trailingAnchor, constant: -16)
        
        self.billNetTitleLabel
            .topAnchor(equalTo: self.billTaxTitleLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.billIcon.trailingAnchor, constant: 10)
        
        self.billNetLabel
            .topAnchor(equalTo: self.billTaxLabel.bottomAnchor, constant: 4)
            .leadingAnchor(equalTo: self.billNetTitleLabel.trailingAnchor, constant: 10)
            .trailingAnchor(equalTo: self.billContainer.trailingAnchor, constant: -16)
            .bottomAnchor(equalTo: self.billContainer.bottomAnchor, constant: -16)
    }
    
    private func setupPaymentContainerConstraints() {
        self.paymentContainer
            .widthAnchor(equalTo: self.view.widthAnchor)
        
        self.paymentTopLineView
            .topAnchor(equalTo: self.paymentContainer.topAnchor)
            .leadingAnchor(equalTo: self.paymentContainer.leadingAnchor, constant: 16)
            .trailingAnchor(equalTo: self.paymentContainer.trailingAnchor, constant: -16)
            .heightAnchor(equalTo: 1.0)
        
        self.paymentIcon
            .topAnchor(equalTo: self.paymentTopLineView.bottomAnchor, constant: 16)
            .leadingAnchor(equalTo: self.paymentContainer.leadingAnchor, constant: 16)
            .widthAnchor(equalTo: 30)
            .heightAnchor(equalTo: 30)
        
        self.paymentTitleLabel
            .topAnchor(equalTo: self.paymentIcon.bottomAnchor, constant: 10)
            .leadingAnchor(equalTo: self.paymentContainer.leadingAnchor, constant: 16)
        
        self.paymentQtdLabel
            .topAnchor(equalTo: self.paymentTitleLabel.topAnchor)
            .leadingAnchor(equalTo: self.paymentTitleLabel.trailingAnchor, constant: 35)
            .trailingAnchor(equalTo: self.paymentContainer.trailingAnchor, constant: -16)
            .bottomAnchor(equalTo: self.paymentContainer.bottomAnchor, constant: -16)
    }
    
}
