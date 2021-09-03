//
//  NWListViewController.swift
//  NewsApp
//


import UIKit

class NWListViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    private var viewModel = NWListViewModel()
    
    //MARK: - ViewController Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadNewsList()
    }
    
    private func setupView() {
        let nib = UINib(nibName: "NWListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TblCellIdentifier.listViewCell)
        tableView.tableFooterView = UIView()
        self.title = "News"
    }
    
    func loadNewsList() {
        viewModel.loadNewsList(withLoader: true) { (isLoaded, errorDescription) in
            if isLoaded {
                self.tableView.reloadData()
            } else {
                self.showAlert(message: errorDescription ?? "")
            }
        }
    }
    
    func reloadNewsList() {
        loadNewsList()
    }
}

//MARK: - UITableView Datasource & Delegates
extension NWListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TblCellIdentifier.listViewCell) as! NWListTableViewCell
        cell.setCellWith(article: viewModel.items.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = viewModel.items.value[indexPath.row]
        let detailVC = storyboard?.instantiateViewController(identifier: "NWDetailViewController") as! NWDetailViewController
        detailVC.article = vm
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

//MARK: - UISearchbar Delegates
extension NWListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        searchQuery = searchBar.text ?? ""
        reloadNewsList()
    }
}

extension NWListViewController: Alertable {
    func showAlert(message: String) {
        self.showAlert(title: appName, message: message)
    }
}
