//
//  SlideShowVC.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 25.10.2023.
//

import UIKit
import SnapKit

class SlideShowVC: UIViewController {
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
    let text: [String]
    let label: UILabel = UILabel()
    var counter: Int = 0
    lazy var playerView: UIView = {
        let content: UIView = UIView()
        content.backgroundColor = #colorLiteral(red: 1, green: 0.777202558, blue: 0.6930688003, alpha: 1)
        content.layer.cornerRadius = 20
        return content
    }()
    lazy var playOrPauseButton: UIButton = {
        let content: UIButton = UIButton()
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
        content.setImage(UIImage(systemName: "play", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
        content.addTarget(self, action: #selector(playOrPause), for: .touchUpInside)
        content.backgroundColor = #colorLiteral(red: 0.5843137255, green: 0.2039215686, blue: 0.2039215686, alpha: 1)
        return content
    }()
    lazy var slider: UISlider = {
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
    
    init(text: [String]) {
        self.text = text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8823529412, green: 0.8509803922, blue: 0.768627451, alpha: 1)
        setupUI()
        start()
    }
    
    func setupUI() {
        let window = UIApplication.shared.keyWindow
        let topPadding = window?.safeAreaInsets.top
        let bottomPadding = window?.safeAreaInsets.bottom
        print("Paddings", topPadding, bottomPadding)
        let widthOfScreen = UIScreen.main.bounds.width
        let heightOfScreen = UIScreen.main.bounds.height
        view.addSubview(label)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.8823529412, green: 0.8509803922, blue: 0.768627451, alpha: 1)
        label.numberOfLines = 0
        // Label
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((topPadding ?? 0))
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(view.safeAreaLayoutGuide.layoutFrame.size.height - 115 - (topPadding ?? 0) - (bottomPadding ?? 0))
        }
        // View of Buttons
        view.addSubview(playerView)
        playerView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(65)
            
        }
        // Start and Stop Button
        playerView.addSubview(playOrPauseButton)
        playOrPauseButton.addShadow(to: [.top, .bottom, .left, .right], radius: 5.0, width: (widthOfScreen - 40) / 3, height: 65)
        playOrPauseButton.snp.makeConstraints { make in
            make.top.equalTo(playerView.snp.top)
            make.leading.equalTo(playerView.snp.leading).offset((widthOfScreen - 40) / 3)
            make.width.equalTo((widthOfScreen - 40) / 3)
            make.height.equalTo(65)
        }
        // Slider
        view.addSubview(slider)
        slider.backgroundColor = #colorLiteral(red: 0.8823529412, green: 0.8509803922, blue: 0.768627451, alpha: 1)
        slider.snp.makeConstraints { make in
            make.top.equalTo(playerView.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
    
    @objc func changeTime(sender:UISlider!, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .moved: do {
                onPlay = false
                self.counter = Int(sender.value * 10)
                self.label.text = self.text[self.counter]
            }
            case .ended: do {
                self.counter = Int(sender.value * 10)
                self.label.text = self.text[self.counter]
            }
                default:
                    break
            }
        }
    }
    
    @objc func playOrPause() {
        if(onPlay == false) {
            onPlay = true
            start()
        } else {
            onPlay = false
        }
    }
    
    func start() {
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if(self.onPlay == false) {
                    timer.invalidate()
                    return
                }
                if(self.counter < self.text.count) {
                    self.label.text = self.text[self.counter]
                    self.counter += 1
                } else {
                    self.label.text = "Thanks For Your Attention!"
                    timer.invalidate()
                    return
                }
                print(self.counter)
                UIView.animate(withDuration: 10.0, animations: {
                    self.slider.value = Float(self.counter) / Float(self.text.count)
                })
            }
        }
    }
}
