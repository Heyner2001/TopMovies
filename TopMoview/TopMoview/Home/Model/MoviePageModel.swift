//
//  MoviePageModel.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 13/05/24.
//

import Foundation

struct MoviePageModel: Codable {
    var page: Int
    var results: [MovieModel]
    var totalPages: Int
    var totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
