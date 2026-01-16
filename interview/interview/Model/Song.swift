//
//  Song.swift
//  interview
//
//  Created by Saad Ahmed on 11/09/2025.
//

struct SearchResponse: Codable {
    let results: [Song]
}

struct Song: Codable {
    let trackName: String?
    let artistName: String?
    let artworkUrl100: String?
    let collectionName: String?
    let trackPrice: Double?
    let currency: String?
}
