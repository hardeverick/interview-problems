//
//  ViewController.swift
//  interview
//
//  Created by Saad Ahmed on 11/09/2025.
//

import UIKit

class SongsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = SongsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Songs"
        let nib = UINib(nibName: "SongTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SongCell")
        tableView.dataSource = self
        tableView.rowHeight = 70
        
        viewModel.fetchSongs { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension SongsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as? SongTableViewCell else {
            return UITableViewCell()
        }
        let song = viewModel.songs[indexPath.row]
        cell.configure(with: song, index: indexPath.row)
        return cell
    }
}
