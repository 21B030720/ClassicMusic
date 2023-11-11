//
//  MiniPlayerView.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 13.10.2023.
//

import UIKit
import AVKit
import AVFoundation

class MiniPlayerView: UIView {
    // MARK: - Attributes
    let track = ""
    var player = AVAudioPlayer()
    let playButton: UIButton = {
        let content = UIButton()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .darkGray
        let image = UIImage(systemName: "play")
        content.setImage(image, for: .normal)
        content.addTarget(self, action: #selector(playOrPauseTrack), for: .touchUpInside)
        return content
    }()
    var slider: UISlider = {
        let content = UISlider()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false
        content.minimumTrackTintColor = .red
        content.maximumTrackTintColor = .white
        content.setThumbImage(UIImage(named: "sliderThumb"), for: .normal)
        content.isContinuous = false
        content.addTarget(self, action: #selector(changeTime(sender:event:)), for: .valueChanged)
        return content
    }()
    
    // MARK: - Init
    override func draw(_ rect: CGRect) {
        
    }
    
    // MARK: - Operations
    func loadMusic() {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func playOrPauseTrack() {
        if(!player.isPlaying) {
            player.play()
        } else {
            player.pause()
        }
    }
    
    @objc func changeTime(sender:UISlider!, event: UIEvent) {
        player.currentTime = TimeInterval(sender.value*Float(player.duration))

        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
                case .began:
                    player.currentTime = TimeInterval(sender.value*Float(player.duration))
                case .moved:
                    player.currentTime = TimeInterval(sender.value*Float(player.duration))
                case .ended:
                player.currentTime = TimeInterval(sender.value*Float(player.duration))
                    
                default:
                    break
            }
        }
    }

}
