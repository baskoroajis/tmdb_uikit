//
//  Movies.swift
//  IMDBUIkit
//
//  Created by Baskoro on 24/03/23.
//

import Foundation

struct Movies: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
