//
//  SongTableViewCell.swift
//  interview
//
//  Created by Saad Ahmed on 11/09/2025.
//

import UIKit

import UIKit

class SongTableViewCell: UITableViewCell {
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var viewForPrice: UIView!
    
    func configure(with song: Song, index: Int) {
        viewForPrice.layer.cornerRadius = 6
        viewForPrice.layer.borderWidth = 1
        viewForPrice.layer.borderColor = UIColor.blue.cgColor
        viewForPrice.clipsToBounds = true
        indexLabel.text = "\(index + 1)" 
        titleLabel.text = song.trackName
        artistLabel.text = song.artistName
        if let price = song.trackPrice, let currency = song.currency {
            priceLabel.text = "$\(price)"
        } else {
            priceLabel.text = ""
        }
        
        if let urlString = song.artworkUrl100, let url = URL(string: urlString) {
            // For now use async image load (better with SDWebImage or Kingfisher)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.artworkImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
