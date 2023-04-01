//
//  ApiCall.swift
//  IMDBUIkit
//
//  Created by Baskoro on 24/03/23.
//

import Foundation

class ApiCall: ApiServices{
    static let shared = ApiCall()
    
    private let baseUrl = "https://api.themoviedb.org/3/"
    private let apiKey = "1622eb3573df51c6468f0baec1e9c421"
    private let urlSession = URLSession.shared
    
    func getMovies(endPoint: ApiEndPoint, completion: @escaping (Result<Movies, ApiError>) -> ()) {
        guard let url = URL(string: "\(baseUrl)\(endPoint.rawValue)") else{
            executeCompletionOnMainThread(with: .failure(.invalidEndPoint), completion: completion)
            return
        }
        
        self.loadURLAndDecode(url: url, params: ["primary_release_date.gte":"2023-01-01","primary_release_date.lte":"2023-03-20" ],completion: completion)
    }
    
    func getMovie(id: String, completion: @escaping (Result<Movie, ApiError>) -> ()) {
        return
    }
    
    func searchMovie(id: String, completion: (Result<Movies, ApiError>) -> ()) {
        return
    }
    
    private func loadURLAndDecode<D:Decodable>(url:URL, params:[String:String]? = nil, completion: @escaping(Result<D,ApiError>) -> ()){
        guard var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false) else{
            completion(.failure(.invalidEndPoint))
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        
        if let params = params {
            queryItems.append(contentsOf: params.map{URLQueryItem(name:$0.key, value: $0.value)})
        }
        
        urlComponent.queryItems = queryItems
        
        guard let finalUrl = urlComponent.url else {
            completion(.failure(.invalidEndPoint))
            return
        }

        
        urlSession.dataTask(with:finalUrl){[weak self] (data, response, error) in
            
            guard let self = self else { return }
            
            if error != nil {
                completion(.failure(.apiError))
                self.executeCompletionOnMainThread(with: .failure(.apiError), completion: completion)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionOnMainThread(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionOnMainThread(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let decodedData = try JsonDecoder.decodeJson.decode(D.self, from: data)
                self.executeCompletionOnMainThread(with: .success(decodedData), completion: completion)
            }catch{
                self.executeCompletionOnMainThread(with:.failure(.serializationError), completion: completion)
            }
        }.resume()
        
    }
    
    private func executeCompletionOnMainThread<D:Decodable>(with result: Result<D , ApiError>, completion: @escaping(Result<D , ApiError>) -> ()) {
        
        DispatchQueue.main.async {
            completion(result)
        }
        
    }
    
    
    
}
