//
//  Trash.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 13.10.2023.
//

import Foundation
/*

private func playVideoWithSegue() {
        guard let path = Bundle.main.path(forResource: "audio1", ofType:"mp3") else {
            debugPrint("video1.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }

func DisplayVideoFromUrl() {
    //        playVideoWithSegue()
    //        videoView.translatesAutoresizingMaskIntoConstraints = false
    //        scroller.addSubview(videoView)
    //        videoView.leadingAnchor.constraint(equalTo: scroller.leadingAnchor, constant: 50).isActive = true
    //        videoView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
    //        videoView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    //        videoView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    //        videoView.backgroundColor = .brown
            DisplayVideoFromUrl()
    //        thirdPlayer()
    guard let path = Bundle.main.path(forResource: "audio1", ofType:"mp3") else {
        debugPrint("audio1.mp3 not found")
        return
    }
    let player = AVPlayer(url: URL(fileURLWithPath: path))

    let playerLayer = AVPlayerLayer(player: player)

    playerLayer.videoGravity = .resizeAspectFill //
    playerLayer.needsDisplayOnBoundsChange = true //
    playerLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200) // 1
    
    videoView.layer.masksToBounds = true // 2
    videoView.layer.addSublayer(playerLayer)
    player.pause()

    player.play()
}

func thirdPlayer() {
    guard let path = Bundle.main.path(forResource: "audio1", ofType:"mp3") else {
        debugPrint("audio1.mp3 not found")
        return
    }
    let player = AVPlayer(url: URL(fileURLWithPath: path))
    let playerVC = AVPlayerViewController()
    playerVC.view.translatesAutoresizingMaskIntoConstraints = false
    playerVC.player = player
//        playerVC.
    self.addChild(playerVC)
    let screenSize = UIScreen.main.bounds.size
    let videoFrame = CGRect(x: 0, y: 10, width: screenSize.width, height: 20)
    playerVC.view.frame = videoFrame
    scroller.addSubview(playerVC.view)
    playerVC.view.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
    playerVC.view.widthAnchor.constraint(equalToConstant: 400).isActive = true
    playerVC.view.heightAnchor.constraint(equalToConstant: 20).isActive = true
    player.play()
}

*/



//        imageView.clipsToBounds = true;
//        imageView.layer.opacity = 0.3
//        imageView.contentMode = .scaleAspectFill
//        imageView.backgroundColor = UIColor(patternImage: imageView.image!)
//        imageView.contentMode = .scaleToFill
