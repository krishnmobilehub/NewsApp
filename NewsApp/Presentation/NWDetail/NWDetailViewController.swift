//
//  NWDetailViewController.swift
//  NewsApp
//


import UIKit

class NWDetailViewController: UIViewController {

    //MARK: - IBOutLets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var article: NWListItemViewModel?
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func setupView() {
        let nib1 = UINib(nibName: "NWDetailmageTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: TblCellIdentifier.detailImageCell)
        
        let nib2 = UINib(nibName: "NWDetailTagTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: TblCellIdentifier.detailTagCell)
        
        let nib3 = UINib(nibName: "NWDetailHeaderTableViewCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: TblCellIdentifier.detailHeaderCell)
        
        let nib4 = UINib(nibName: "NWDetailDescriptionTableViewCell", bundle: nil)
        tableView.register(nib4, forCellReuseIdentifier: TblCellIdentifier.detailDescriptionCell)
        
        if let source = article?.source, let name = source.name {
            self.title = name
        }
        
        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }
}

//MARK: - UITableView Datasource & Delegates
extension NWDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            //Image View Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TblCellIdentifier.detailImageCell) as! NWDetailmageTableViewCell
            cell.configureData(url: article?.urlToImage ?? "")
            return cell
        case 1:
            //Tag View Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TblCellIdentifier.detailTagCell) as! NWDetailTagTableViewCell
            return cell
        case 2:
            //Description View Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TblCellIdentifier.detailHeaderCell) as! NWDetailHeaderTableViewCell
            cell.configureData(title: article?.title ?? "")
            return cell
        case 3:
            //Description View Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TblCellIdentifier.detailDescriptionCell) as! NWDetailDescriptionTableViewCell
            cell.configureData(description: article?.description ?? "", url: article?.url ?? "")
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return self.view.frame.size.height / 3
        case 1:
            return 80
        default:
            return UITableView.automaticDimension
        }
    }
    
}
