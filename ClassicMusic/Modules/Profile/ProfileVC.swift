//
//  ProfileVC.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 06.11.2023.
//

import UIKit
import SnapKit

class ProfileVC: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let content: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 190, height: 190))
        content.image = UIImage(named: "Beethoven.jpg")
        return content
    }()
    
    private lazy var favoritesButton: CustonButton = {
        let content: CustonButton = CustonButton()
        content.backgroundColor = UIColor(patternImage: UIImage(named: "old-paper-white")!)
        content.addTarget(self, action: #selector(openFavorites), for: .touchUpInside)
        content.setTitle("Favorites", for: .normal)
        var config = UIImage.SymbolConfiguration(textStyle: .largeTitle, scale: .large)
        let image = UIImage(systemName: "greaterthan", withConfiguration: config)
        content.setImage(image, for: .normal)
        return content
    }()
    
    private lazy var achievementsButton: CustonButton = {
        let content: CustonButton = CustonButton()
        content.backgroundColor = UIColor(patternImage: UIImage(named: "old-paper-yellow")!)
        content.addTarget(self, action: #selector(openAchievements), for: .touchUpInside)
        content.setTitle("Achievements", for: .normal)
        var config = UIImage.SymbolConfiguration(textStyle: .largeTitle, scale: .large)
        let image = UIImage(systemName: "greaterthan", withConfiguration: config)
        content.setImage(image, for: .normal)
        return content
    }()
    
    private lazy var textView: UITextView = {
        let content: UITextView = UITextView()
        content.backgroundColor = #colorLiteral(red: 0.2875141953, green: 0.2079364552, blue: 0.1475090749, alpha: 0.8470588235)
        content.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)!
        return content
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.831372549, blue: 0.831372549, alpha: 1)
        hidesBottomBarWhenPushed = true
        setupUI()
    }
    
    private func setupUI() {
        // Image View
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(73)
            make.leading.equalToSuperview().offset(100)
            make.width.equalTo(190)
            make.height.equalTo(190)
        }
        imageView.setRounded()
        // Favorites
        view.addSubview(favoritesButton)
        favoritesButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(294)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(64)
        }
        // Achievements
        view.addSubview(achievementsButton)
        achievementsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(377)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(64)
        }
        // Text View
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(472)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(242)
        }
    }
    
    @objc private func openFavorites() {
        
    }
    
    @objc private func openAchievements() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class CustonButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        contentHorizontalAlignment = .left
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}
