//
//  ListTableViewDataSource.swift
//  Lenskart Task
//
//  Created by vinumurugan E on 28/02/22.
//

import Foundation
import UIKit

class ListDataSource<T> : NSObject, UITableViewDataSource {
    
    var data: DynamicValue<[T]> = DynamicValue([])
    
    var addToWatchAction : ((Int) -> ())!
            
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableVCell", for: indexPath) as! ListTableVCell
        cell.info = data.value[indexPath.row] as? Movies
        cell.addToWatchAction = {
            self.addToWatchAction(indexPath.row)
        }
        return cell
    }
    
}
