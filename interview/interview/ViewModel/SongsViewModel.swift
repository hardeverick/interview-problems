//
//  SongsViewModel.swift
//  interview
//
//  Created by Saad Ahmed on 11/09/2025.
//

import Foundation


class SongsViewModel {
    private let apiService = APIService()
    var songs: [Song] = []
    
    func fetchSongs(completion: @escaping () -> Void) {
        apiService.fetchSongs { [weak self] result in
            switch result {
            case .success(let songs):
                self?.songs = songs
                DispatchQueue.main.async { completion() }
            case .failure(let error):
                print("Error fetching songs:", error)
            }
        }
    }
}
