//
//  DetailsViewController.swift
//  Lenskart Task
//
//  Created by vinumurugan E on 28/02/22.
//

import UIKit

protocol DetailsProtocol {
    func updateValues(info :Movies,index:Int)
}

class DetailsViewController: UIViewController {
    
    var items : Movies!
    
    var index : Int!
    
    @IBOutlet weak var originalTitlelbl: UILabel!
    
    @IBOutlet weak var titlelbl: UILabel!
    
    @IBOutlet weak var overviewlbl: UILabel!
    
    @IBOutlet weak var popularitylbl: UILabel!
    
    @IBOutlet weak var releaselbl: UILabel!

    @IBOutlet weak var votelbl: UILabel!
    
    @IBOutlet weak var watchlistbtn: UIButton!
    
    var idelegate: DetailsProtocol! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if items.isWatch_list == nil {
            items.isWatch_list = false
        }
        watchlistbtn.setImage(UIImage(systemName:(items.isWatch_list == nil) ? "bookmark" : (items.isWatch_list == true) ? "bookmark.fill" : "bookmark"), for: .normal)
        originalTitlelbl.text = items.original_title ?? ""
        titlelbl.text = items.title ?? ""
        overviewlbl.text = items.overview ?? ""
        popularitylbl.text = "\(items.popularity ?? Double())"
        releaselbl.text = items.release_date ?? ""
        votelbl.text = "\(items.vote_count ?? 0)"
    }
    
    @IBAction func addToWatchListAction(_ sender: Any) {
        items.isWatch_list = !items.isWatch_list!
        watchlistbtn.setImage(UIImage(systemName:(items.isWatch_list!) ? "bookmark.fill" : "bookmark"), for: .normal)
        idelegate.updateValues(info: items, index: index)
    }
}
