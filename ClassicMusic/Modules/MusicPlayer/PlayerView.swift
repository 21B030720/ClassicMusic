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
    var onPlay: Bool = false {
        willSet {
            let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
            let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
            if newValue {
                playOrPauseButton.setImage(UIImage(systemName: "pause", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
            } else {
                playOrPauseButton.setImage(UIImage(systemName: "play", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
            }
        }
    }
    var isSliderMovingByTime: Bool = true
    var currentTrackAddress = 0
    lazy var list: [String] = []
    lazy var listURL: [String] = []
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
    let playOrPauseButton: UIButton = {
        let content = UIButton()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .clear
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
        content.setImage(UIImage(systemName: "play", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
        content.addTarget(self, action: #selector(playOrPauseTrack), for: .touchUpInside)
        return content
    }()
    let nextButton: UIButton = {
        let content = UIButton()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .clear
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
        content.setImage(UIImage(systemName: "forward", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
        content.addTarget(self, action: #selector(nextTrack), for: .touchUpInside)
        return content
    }()
    let prevButton: UIButton = {
        let content = UIButton()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .clear
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
        content.setImage(UIImage(systemName: "backward", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
        content.addTarget(self, action: #selector(prevTrack), for: .touchUpInside)
        return content
    }()
    
    // MARK: - Init
    override func draw(_ rect: CGRect) {
        loadMusic()
        layer.cornerRadius = 20
        backgroundColor = #colorLiteral(red: 0.8823529412, green: 0.8235294118, blue: 0.8235294118, alpha: 1)
        addSubview(playOrPauseButton)
        addSubview(prevButton)
        addSubview(nextButton)
        addSubview(slider)
        slider.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(20)
        }
        prevButton.snp.makeConstraints { make in
            make.top.equalTo(slider.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(25)
            make.bottom.equalToSuperview()
            make.width.equalTo((frame.size.width - 50) / 3)
        }
        playOrPauseButton.snp.makeConstraints { make in
            make.top.equalTo(slider.snp.bottom).offset(10)
            make.leading.equalTo(prevButton.snp.trailing)
            make.bottom.equalToSuperview()
            make.width.equalTo((frame.size.width - 50) / 3)
        }
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(slider.snp.bottom).offset(10)
            make.leading.equalTo(playOrPauseButton.snp.trailing)
            make.bottom.equalToSuperview()
            make.width.equalTo((frame.size.width - 50) / 3)
        }
    }
    
    // MARK: - Operations
    func loadMusic() {
        player.stop()
        let address = currentTrackAddress % list.count
        if listURL[address] != "" {
            loadURLMusic(urlString: listURL[address])
            return
        }
        guard let url = Bundle.main.url(forResource: list[address], withExtension: "mp3") else { return }
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
    
    func loadURLMusic(urlString: String) {
        let url = URL(string: urlString)
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url!) { (url, response, error) in
            do {
                self.player = try AVAudioPlayer(contentsOf: url! as URL)
                self.player.prepareToPlay()
                self.player.volume = 2.0
                self.player.play()
            } catch let error as NSError {
                print(error.localizedDescription)
            } catch {
                print("AVAudioPlayer init failed")
            }
        }
        downloadTask.resume()
        updateSlider()
    }
    
    @objc func playOrPauseTrack() {
        if(!player.isPlaying) {
            player.play()
            updateSlider()
            onPlay = true
        } else {
            player.pause()
            onPlay = false
        }
    }
    @objc func nextTrack() {
        onPlay = false
        currentTrackAddress += 1
        if(currentTrackAddress >= list.count) {
            currentTrackAddress = 0
        }
//        player.pause()
        onPlay = true
        loadMusic()
        player.play()
    }
    @objc func prevTrack() {
        onPlay = false
        currentTrackAddress -= 1
        if(currentTrackAddress < 0) {
            currentTrackAddress = 4
        }
//        player.pause()
        onPlay = true
        loadMusic()
        player.play()
    }
    
    // When Tap Track
    func playTrackByAddress(address: Int) {
        onPlay = false
        currentTrackAddress = address
        onPlay = true
        loadMusic()
        player.play()
    }
    
    // Manual Scrolling of Slider
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
    
    // Slider Moves by Time when Player is Working
    func updateSlider() {
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.onPlay == false {
                    timer.invalidate()
                    return
                }
                if self.isSliderMovingByTime {
                    UIView.animate(withDuration: 10.0, animations: {
                        self.slider.value = Float(self.player.currentTime) / Float(self.player.duration)
                    })
                }
            }
        }
    }


}


