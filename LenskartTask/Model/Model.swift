//
//  Model.swift
//  Lenskart Task
//
//  Created by vinumurugan E on 28/02/22.
//

import Foundation

struct Results:Codable {
    let results : [Movies]?
    let total_pages : Int?
    let total_results : Int?
    let page : Int?
}

struct Movies:Codable {
    let original_language: String?
    let original_title: String?
    let overview: String?
    let release_date: String?
    let title: String?
    let popularity: Double?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
    let adult: Bool?
    let backdrop_path: String?
    var isWatch_list: Bool?
}

