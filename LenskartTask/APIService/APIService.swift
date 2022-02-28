//
//  APIService.swift
//  Lenskart Task
//
//  Created by vinumurugan E on 28/02/22.
//

import Foundation
import UIKit

class APIService: NSObject {
    
    static let shared = APIService()
        
    func getResponse(page:Int,completionHandler: @escaping([Movies]) -> Void) {
                        
        URLSession.shared.dataTask(with: URL(string: "http://api.themoviedb.org/3/search/movie?api_key=7e588fae3312be4835d4fcf73918a95f&query=a&page=\(page)")!)  { (data, response, error) in
            DispatchQueue.main.async {
                if let data1 = data {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(Results.self, from: data1)
                        completionHandler(result.results ?? [Movies]())
                    } catch {
                        print("error on decode: \(error.localizedDescription)")
                    }
                }
            }
        }.resume()
    }
}
