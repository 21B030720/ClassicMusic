//
//  PlayerView.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 13.10.2023.
//

import UIKit
import AVKit
import AVFoundation

class PlayerView: UIView {
    // MARK: - Attributes
    var isSliderMovingByTime: Bool = true
    var currentTrackAddress = 0
    let list = ["tanya", "airplane_graveyard", "stalevar_street", "our_summer", "audio1"]
    var player = AVAudioPlayer()
    var slider: UISlider = {
        let content = UISlider()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false
        content.minimumTrackTintColor = .red
        content.maximumTrackTintColor = .white
        content.setThumbImage(UIImage(named: "sliderThumb"), for: .normal)
        content.isContinuous = false
        content.addTarget(self, action: #selector(changeTime(sender:event:)), for: .allTouchEvents)
        return content
    }()
    let playButton: UIButton = {
        let content = UIButton()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .darkGray
        let image = UIImage(systemName: "play")
        content.setImage(image, for: .normal)
        content.addTarget(self, action: #selector(playOrPauseTrack), for: .touchUpInside)
        return content
    }()
    let nextButton: UIButton = {
        let content = UIButton()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .darkGray
        let image = UIImage(systemName: "forward")
        content.setImage(image, for: .normal)
        content.addTarget(self, action: #selector(nextTrack), for: .touchUpInside)
        return content
    }()
    let prevButton: UIButton = {
        let content = UIButton()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .darkGray
        let image = UIImage(systemName: "backward")
        content.setImage(image, for: .normal)
        content.addTarget(self, action: #selector(prevTrack), for: .touchUpInside)
        return content
    }()
    
    
    // MARK: - Init
    override func draw(_ rect: CGRect) {
        loadMusic()
        backgroundColor = .blue
        addSubview(playButton)
        addSubview(prevButton)
        addSubview(nextButton)
        addSubview(slider)
        NSLayoutConstraint.activate([
            prevButton.topAnchor.constraint(equalTo: topAnchor),
            prevButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            prevButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            prevButton.widthAnchor.constraint(equalToConstant: frame.size.width / 3),
            // Main Button
            playButton.topAnchor.constraint(equalTo: topAnchor),
            playButton.leadingAnchor.constraint(equalTo: prevButton.trailingAnchor),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            playButton.widthAnchor.constraint(equalToConstant: frame.size.width / 3),
            // Next Button
            nextButton.topAnchor.constraint(equalTo: topAnchor),
            nextButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor),
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            nextButton.widthAnchor.constraint(equalToConstant: frame.size.width / 3),
            // Slider
            slider.topAnchor.constraint(equalTo: nextButton.bottomAnchor),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    // MARK: - Operations
    func loadMusic() {
        guard let url = Bundle.main.url(forResource: list[currentTrackAddress], withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
        updateSlider()
    }
    
    @objc func playOrPauseTrack() {
        if(!player.isPlaying) {
            player.play()
        } else {
            player.pause()
        }
    }
    @objc func nextTrack() {
        currentTrackAddress += 1
        if(currentTrackAddress > 4) {
            currentTrackAddress = 0
        }
//        player.pause()
        loadMusic()
        player.play()
    }
    @objc func prevTrack() {
        currentTrackAddress -= 1
        if(currentTrackAddress < 0) {
            currentTrackAddress = 4
        }
//        player.pause()
        loadMusic()
        player.play()
    }
    @objc func changeTime(sender:UISlider!, event: UIEvent) {
        player.currentTime = TimeInterval(sender.value*Float(player.duration))

        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .began: do {
//                self.player.currentTime = TimeInterval(sender.value*Float(player.duration))
                self.isSliderMovingByTime = false
                print("began")
            }
            case .moved: do {
                player.prepareToPlay()
                player.play()
//                self.player.currentTime = TimeInterval(sender.value*Float(player.duration))
//                self.isSliderMovingByTime = false
                print("moved")
            }
            case .ended: do {
                self.player.currentTime = TimeInterval(sender.value*Float(player.duration))
                self.isSliderMovingByTime = true
                player.play()
                print("ended", self.isSliderMovingByTime)
            }
                default:
                    break
            }
        }
        self.isSliderMovingByTime = true
    }
    func updateSlider() {
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
                if self.isSliderMovingByTime {
                    UIView.animate(withDuration: 10.0, animations: {
                        self.slider.value = Float(self.player.currentTime) / Float(self.player.duration)
                    })
                }
            }
        }
    }


}


