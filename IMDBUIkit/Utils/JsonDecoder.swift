//
//  JsonDecoder.swift
//  IMDBUIkit
//
//  Created by Baskoro on 24/03/23.
//

import Foundation

class JsonDecoder {
    
    static let decodeJson:JSONDecoder = {
        let jsonDecoder = JSONDecoder()
//        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter:DateFormatter = {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-mm-dd"
        return dateFormater
    }()
}
