//
//  ArticleView.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 02.12.2023.
//

import UIKit

class ArticleView: UIView {
    let status = "+"
    let scroller: UIScrollView = UIScrollView()
    var imageView: UIImageView! // Image of Person
    let imageBackground: UIView = UIView()
    var label: UILabel! // Text about Person
    let player: PlayerView = PlayerView()
    let buttonSlideShow: UIButton = {
        let content = UIButton()
        content.setTitle("SlideShow", for: .normal)
        content.addTarget(self, action: #selector(openSlideShow), for: .touchUpInside)
        content.tintColor = .systemTeal
        content.alpha = 0.7
        content.backgroundColor = .blue
        return content
    }()
    let optionalButtonsView: UIView = {
        let content = UIView()
        return content
    }()
    let musicButton: UIButton = {
        let content: UIButton = UIButton()
        content.setImage(UIImage(systemName: "fleuron.fill"), for: .normal)
        content.backgroundColor = .clear
        return content
    }()
    weak var viewController: ArticleVC!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        // Scroll View
        setupScroller()
        // Image
        setupImage()
        // Slide Show Button
        setupSlideShowButton()
        // Optional Buttons
        setupOptionalButtons()
        // Label
        setupLabel()
        // Player
        setupPlayer()
        // Navbar Buttons
        setupNavBar()
    }
    
    func setupScroller() {
        // Scroller
        addSubview(scroller)
        scroller.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(-150)
            make.bottom.width.equalToSuperview()
        }
//        let currentWidth = self.viewController.view.frame.size.width
//        let width = currentWidth - 100
//        let currentHeight = currentWidth * (imageView.image!.size.height / imageView.image!.size.width)
//        let height = width * (imageView.image!.size.height / imageView.image!.size.width)
    }
    
    func setupImage() {
        scroller.addSubview(imageView)
        imageView.isUserInteractionEnabled = true
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
        imageView.contentMode = .center
        imageView.clipsToBounds = true;

        imageView.snp.makeConstraints { make in
            make.top.equalTo(scroller.snp.top)
            make.leading.equalTo(scroller.snp.leading)
            make.width.equalTo(scroller.snp.width)
            make.height.equalTo(228)
        }
    }
    
    func setupSlideShowButton() {
        let widthOfScreen = (UIScreen.main.bounds.width - 200) / 2
        print("Width of view", widthOfScreen)
        imageView.addSubview(buttonSlideShow)
        buttonSlideShow.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(140)
            make.leading.equalTo(imageView.snp.leading).offset(widthOfScreen)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    func setupLabel() {
        let currentWidth = UIScreen.main.bounds.width
        let width = currentWidth - 100
        scroller.addSubview(label)
        label.backgroundColor = .blue
        label.numberOfLines = 0
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalTo(scroller.snp.leading).offset(20)
            make.width.equalTo(width + 60)
        }
    }
    
    func setupPlayer() {
        let currentWidth = UIScreen.main.bounds.width
        let width = currentWidth - 100
        scroller.addSubview(player)
        player.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.leading.equalTo(scroller.snp.leading).offset(20)
            make.width.equalTo(width+60)
            make.height.equalTo(60)
            make.bottom.equalTo(scroller.snp.bottom)
        }
    }
    
    func setupNavBar() {
        let firstButtonItem = UIBarButtonItem(title: status, style: .plain, target: self, action: #selector(options))
        let font = UIFont.systemFont(ofSize: 30)
        firstButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        space.width = 40
        let secondButtonItem = UIBarButtonItem(title: "Slide Show", style: .plain, target: self, action: #selector(openSlideShow))
        viewController.navigationItem.rightBarButtonItems = [
            firstButtonItem,
            space,
            secondButtonItem
        ]
    }
    
    func setupOptionalButtons() {
//        let newView = UIView()
//        newView.backgroundColor = #colorLiteral(red: 0.6914221048, green: 0.5730599165, blue: 0.5702240467, alpha: 1)
//        addSubview(newView)
//        newView.snp.makeConstraints { make in
//            <#code#>
//        }
    }
    
    @objc func options() {
        viewController.options()
    }
    
    @objc func openSlideShow() {
        viewController.openSlideShow()
    }

}
