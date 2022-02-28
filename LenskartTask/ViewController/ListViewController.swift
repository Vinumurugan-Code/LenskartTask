//
//  ViewController.swift
//  Lenskart Task
//
//  Created by vinumurugan E on 28/02/22.
//

import UIKit

class ListViewController: UIViewController, DetailsProtocol {
    
    @IBOutlet weak var tableV: UITableView!
    
    @IBOutlet weak var count: UIBarButtonItem!
    
    lazy var loaderMoreView: UIView = {
        let loaderView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        loaderView.color = UIColor.gray
        loaderView.startAnimating()
        return loaderView
    }()
    
    let dataSource = ListDataSource<Movies>()
        
    lazy var viewModel : ListViewModel = {
        let viewModel = ListViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableV.dataSource = self.dataSource
        self.tableV.delegate = self
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.count.title = "\(self?.dataSource.data.value.count ?? 0)"
            self?.tableV.reloadData()
        }
        self.dataSource.addToWatchAction = { index in
            if self.dataSource.data.value[index].isWatch_list == nil {
                self.dataSource.data.value[index].isWatch_list = false
            }
            self.dataSource.data.value[index].isWatch_list = !self.dataSource.data.value[index].isWatch_list!
        }
        self.viewModel.fetchLists()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
      
    
    //MARK:- Details ViewController
    func detailsViewController(info :Movies,index:Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.items = info
        vc.index = index
        vc.idelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateValues(info :Movies,index:Int) {
        self.dataSource.data.value[index] = info
    }

    
 //   MARK:- UI UIScrollView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height {
            self.setUpLoaderView(toShow: true)
            self.viewModel.fetchLists()
        }
    }

    func setUpLoaderView(toShow: Bool) {
        if toShow {
            self.tableV.tableFooterView?.isHidden = false
            self.tableV.tableFooterView = self.loaderMoreView
        } else {
            self.tableV.tableFooterView = UIView()
        }
    }
}



extension ListViewController :UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.items = self.dataSource.data.value[indexPath.row]
        vc.index = indexPath.row
        vc.idelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
