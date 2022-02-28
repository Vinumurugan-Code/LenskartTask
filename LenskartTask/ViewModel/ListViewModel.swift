//
//  ListViewModel.swift
//  Lenskart Task
//
//  Created by vinumurugan E on 28/02/22.
//

import Foundation
import UIKit

class ListViewModel: NSObject {

    var bindListViewModelToController:(() -> ()) = {}

    var page = 1

    var isFetching = false

    var listArr = [Movies] ()
    
    weak var dataSource : ListDataSource<Movies>!

    init(dataSource : ListDataSource<Movies>!) {
        self.dataSource = dataSource
    }

    func fetchLists() {
        if isFetching {
            return
        }
        isFetching = true
        APIService.shared.getResponse(page:page) { [self](result) in
            page += 1
            isFetching = false
            self.dataSource?.data.value.append(contentsOf: result)
        }
    }
}
