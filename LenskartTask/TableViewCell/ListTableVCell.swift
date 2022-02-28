//
//  ListTableVCell.swift
//  Lenskart Task
//
//  Created by vinumurugan E on 28/02/22.
//

import UIKit

class ListTableVCell: UITableViewCell {
    
    @IBOutlet weak var titlelbl: UILabel!
    
    @IBOutlet weak var overviewlbl: UILabel!
    
    @IBOutlet weak var popularitylbl: UILabel!
    
    @IBOutlet weak var releaselbl: UILabel!
    
    @IBOutlet weak var addToWatchbtn: UIButton!
            
    var addToWatchAction : (() -> ())!
    
    @IBAction func addToWatchAction(_ sender: Any) {
        self.addToWatchAction()
    }
    
    var info : Movies? {
        didSet {
            titlelbl.text = info?.title ?? ""
            overviewlbl.text = info?.overview ?? ""
            popularitylbl.text = "\(info?.popularity ?? Double())"
            releaselbl.text = info?.release_date ?? ""
            addToWatchbtn.setImage(UIImage(systemName:(info?.isWatch_list == nil) ? "bookmark" : (info?.isWatch_list == true) ? "bookmark.fill" : "bookmark"), for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
