//
//  ApiError.swift
//  IMDBUIkit
//
//  Created by Baskoro on 24/03/23.
//

import Foundation


enum ApiError: Error, CustomNSError {
    
    case apiError
    case noData
    case invalidEndPoint
    case serializationError
    case invalidResponse
    
    var localizedDescription: String {
        switch self {
            case .apiError:
                return "Failed to Fetch data"
            case .noData:
                return "No data"
            case .invalidEndPoint:
                return "Invalid Endpoint"
            case .serializationError:
                return "Serialization Error"
            case .invalidResponse:
                return "Response Invalid"
        }
    }
    
    var apiErrorInfo :[String:Any]{
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
