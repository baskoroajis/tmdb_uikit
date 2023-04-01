//
//  ApiEndPoint.swift
//  IMDBUIkit
//
//  Created by Baskoro on 24/03/23.
//

import Foundation

enum ApiEndPoint: String {
    case discover = "/discover/movie"
    
    var description: String {
        switch self {
            case .discover: return "Primary Release Date"
        }
    }
}
