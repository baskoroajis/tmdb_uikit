//
//  ApiServices.swift
//  IMDBUIkit
//
//  Created by Baskoro on 23/03/23.
//

import Foundation


protocol ApiServices {
    func getMovies(endPoint:ApiEndPoint, completion: @escaping(Result<Movies, ApiError>) -> ())
    func getMovie(id:String, completion: @escaping(Result<Movie, ApiError>) -> ())
    func searchMovie(id:String, completion: (Result<Movies, ApiError> ) -> ())
}
