//
//  ImageUrl.swift
//  IMDBUIkit
//
//  Created by Baskoro on 25/03/23.
//

import Foundation


class ImageUrl {
    private static let baseUrlImage = "https://image.tmdb.org/t/p/w300"
    
    static func getPosterImageUrl (posterPath:String?) -> String {
        guard (posterPath != nil) else {
            return ""
        }
        
        return "\(baseUrlImage)\(posterPath!)"
    }
}
