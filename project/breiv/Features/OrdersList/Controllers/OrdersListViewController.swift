
import UIKit

class OrdersListViewController: UIViewController {
    
    private var viewModel: OrdersListViewModel
    private var refresh = UIRefreshControl()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(viewModel: OrdersListViewModel = OrdersListViewModel()) {
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
        self.configureTableView()
        self.viewModel.fetchOrders(reload: true)
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
        
        self.viewModel.updateTableView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        self.viewModel.endRefreshing = { [weak self] in
            DispatchQueue.main.async {
                self?.refresh.endRefreshing()
            }
        }
        
        self.viewModel.startRefreshing = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.refresh.beginRefreshing()
                self.tableView.setContentOffset(CGPoint(x: 0, y: -self.refresh.frame.size.height), animated: true)
            }
        }
    }
    
    private func configureViews() {
        self.title = self.viewModel.navigationTitle
        self.navigationItem.rightBarButtonItem = UIBarButtonItem().logout(#selector(self.logout), target: self)
        self.view.backgroundColor = .white
        self.refresh.standard(self, action: #selector(self.handleRefresh))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func insertViews() {
        self.view.addSubview(self.tableView)
    }
    
    private func setupConstraints() {
        self.tableView
            .topAnchor(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            .leadingAnchor(equalTo: self.view.leadingAnchor)
            .trailingAnchor(equalTo: self.view.trailingAnchor)
            .bottomAnchor(equalTo: self.view.bottomAnchor)
    }
    
    private func configureTableView() {
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 32.0, right: 0.0)
        self.tableView.register(OrderCell())
        self.tableView.addSubview(self.refresh)
    }
    
    @objc func handleRefresh() {
        self.viewModel.fetchOrders(reload: true)
    }
    
    @objc func logout() {
        SessionManager.shared.logout()
    }
    
}

extension OrdersListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.viewModel.sections[section]
        return section.numberOfRows(self.viewModel)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = self.viewModel.sections[indexPath.section]
        let identifier = section.cellIdentifier(self.viewModel, indexPath: indexPath)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let item = self.viewModel.orders[indexPath.row]
        
        if let cell = cell as? Reusable {
            cell.setup(item)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        DispatchQueue.main.async {
//            let serviceOrderVM = self.viewModel.serviceOrders[indexPath.row]
//
//            if self.viewModel.canOpenSO(serviceOrderVM) {
//                self.navigate.execution(serviceOrderVM)
//            }
//
            tableView.deselectRow(at: indexPath, animated: true)
//        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = self.viewModel.sections[section]
        return section.headerHeight(self.viewModel)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = self.viewModel.sections[section]
        let summary = OrdersListSummaryView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: section.headerHeight(self.viewModel)))
        summary.setup(self.viewModel)
        return summary
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let endScrolling = scrollView.contentOffset.y + scrollView.frame.size.height
        let end = endScrolling >= (scrollView.contentSize.height - 500)
        
        if end, !self.viewModel.isLoading, !self.viewModel.eof {
            self.viewModel.fetchOrders()
        }
    }
    
}
