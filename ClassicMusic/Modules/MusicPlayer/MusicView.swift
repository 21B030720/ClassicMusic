//
//  MultiPlayerView.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 15.12.2023.
//

import UIKit

class MusicPlayerView: UIView {
    private let table: UITableView = UITableView()
    lazy var player: PlayerView = PlayerView()
    weak var viewController: MusicPlayerVC!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        viewController.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6980392157, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
        backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
        let screenHeight = UIScreen.main.bounds.height
        let window = UIApplication.shared.keyWindow
        let topPadding = window?.safeAreaInsets.top
        let bottomPadding = window?.safeAreaInsets.bottom
        // Table
        addSubview(table)
        table.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
        table.delegate = viewController.self
        table.dataSource = viewController.dataSource
        table.register(TrackCell.self, forCellReuseIdentifier: "cell")
        table.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(topPadding ?? 0)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(screenHeight - (topPadding ?? 0) - (bottomPadding ?? 0) - 130)
        }
        // Player
        addSubview(player)
        player.backgroundColor = #colorLiteral(red: 0.8823529412, green: 0.8235294118, blue: 0.8235294118, alpha: 1)
        player.clipsToBounds = true
        player.layer.cornerRadius = 20
        player.snp.makeConstraints { make in
            make.top.equalTo(table.snp.bottom)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(130)
        }
    }
    

}
