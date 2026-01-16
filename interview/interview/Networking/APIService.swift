//
//  APIService.swift
//  interview
//
//  Created by Saad Ahmed on 11/09/2025.
//

import Foundation

class APIService {
    func fetchSongs(completion: @escaping (Result<[Song], Error>) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=soft&media=music"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
