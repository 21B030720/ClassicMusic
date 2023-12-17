//
//  MultiPlayerVC.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 15.12.2023.
//

import UIKit

class MusicPlayerVC: UIViewController {
    
    lazy var musicPlayerView: MusicPlayerView = MusicPlayerView()
    lazy var dataSource: MusicPlayerDataSource = MusicPlayerDataSource()
    
    override func loadView() {
        self.view = musicPlayerView
        musicPlayerView.viewController = self
    }
    
    init(musicContent: [[String]]) {
        super.init(nibName: nil, bundle: nil)
        dataSource.dataSource = musicContent
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicPlayerView.player.list = []
        for i in dataSource.dataSource {
            musicPlayerView.player.list.append(i[3])
        }
        
        musicPlayerView.setupUI()
    }

}

extension MusicPlayerVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        musicPlayerView.player.playTrackByAddress(address: indexPath.row)
    }
    
   
}
