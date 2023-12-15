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
        content.alpha = 0.9
//        content.backgroundColor = #colorLiteral(red: 0.4887033701, green: 0.1842776537, blue: 0.4522601366, alpha: 1)
        return content
    }()
    
    let optionalButtonsView: UIView = {
        let content = UIView()
        content.backgroundColor = #colorLiteral(red: 0.6914221048, green: 0.5730599165, blue: 0.5702240467, alpha: 1)
        return content
    }()
    
    let musicButton: UIButton = {
        let content: UIButton = UIButton()
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
        content.setImage(UIImage(systemName: "music.note.list", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
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
//        setupScroller()
        // Image
        setupImage()
        // Slide Show Button
        setupSlideShowButton()
        // Optional Buttons
        setupOptionalButtons()
        // Label
//        setupLabel()
        // Player
//        setupPlayer()
        // Navbar Buttons
        // Table of Contents
        setupTable()
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
        addSubview(imageView)
        imageView.isUserInteractionEnabled = true
//        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.addShadow(to: [.top, .bottom, .left, .right], radius: 5.0, width: UIScreen.main.bounds.width, height: 228)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(-150)
            make.leading.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(228)
        }
    }
    
    func setupSlideShowButton() {
        let widthOfScreen = (UIScreen.main.bounds.width - 200) / 2
//        print("Width of view", widthOfScreen)
        imageView.addSubview(buttonSlideShow)
        buttonSlideShow.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(140)
            make.leading.equalTo(imageView.snp.leading).offset(widthOfScreen)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        buttonSlideShow.applyGradient(isVertical: false, colorArray: [#colorLiteral(red: 0.4887033701, green: 0.1842776537, blue: 0.4522601366, alpha: 1), #colorLiteral(red: 0.7274869084, green: 0.2913005352, blue: 0.660961926, alpha: 1)], width: 200, height: 50)
        buttonSlideShow.layer.shadowColor = UIColor.black.cgColor
        buttonSlideShow.layer.shadowOpacity = 1
        buttonSlideShow.layer.shadowOffset = .zero
        buttonSlideShow.layer.shadowRadius = 10
    }
    
    func setupOptionalButtons() {
        let currentWidth = UIScreen.main.bounds.width
        optionalButtonsView.clipsToBounds = true
        addSubview(optionalButtonsView)
        optionalButtonsView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo(currentWidth)
            make.height.equalTo(70)
        }
        
        optionalButtonsView.addShadow(to: [.top], radius: 5.0, width: currentWidth, height: 70)
        optionalButtonsView.layer.masksToBounds = false
        optionalButtonsView.layer.shadowColor = UIColor.black.cgColor
        optionalButtonsView.layer.shadowOpacity = 1
        optionalButtonsView.layer.shadowOffset = .zero
        
        optionalButtonsView.addSubview(musicButton)
        musicButton.snp.makeConstraints { make in
            make.top.equalTo(optionalButtonsView.snp.top)
            make.leading.equalTo(optionalButtonsView.snp.leading).offset(20)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
    }
    
//    func setupLabel() {
//        let currentWidth = UIScreen.main.bounds.width
//        let width = currentWidth - 100
//        scroller.addSubview(label)
//        label.numberOfLines = 0
//        label.snp.makeConstraints { make in
//            make.top.equalTo(optionalButtonsView.snp.bottom).offset(20)
//            make.leading.equalTo(scroller.snp.leading).offset(20)
//            make.width.equalTo(width + 60)
//        }
////        label.layer.shadowColor = UIColor.black.cgColor
////        label.layer.shadowOpacity = 1
////        label.layer.shadowOffset = .zero
////        label.layer.shadowRadius = 10
//    }
    
//    func setupPlayer() {
//        let currentWidth = UIScreen.main.bounds.width
//        let width = currentWidth - 100
//        scroller.addSubview(player)
//        player.snp.makeConstraints { make in
//            make.top.equalTo(label.snp.bottom).offset(20)
//            make.leading.equalTo(scroller.snp.leading).offset(20)
//            make.width.equalTo(width+60)
//            make.height.equalTo(60)
//            make.bottom.equalTo(scroller.snp.bottom)
//        }
//    }
    
    let table: UITableView = {
        let content = UITableView()
        content.backgroundColor = .brown
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    func setupTable() {
        let currentWidth = UIScreen.main.bounds.width
        let width = currentWidth - 100
        table.dataSource = viewController.dataSource
        table.delegate = viewController.self
        table.register(DropperCell.self, forCellReuseIdentifier: "cell")
        table.register(DropDownCell.self, forCellReuseIdentifier: "cell2")
        table.backgroundColor = .clear
        addSubview(table)
        table.snp.makeConstraints { make in
            make.top.equalTo(optionalButtonsView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
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
    
    
    @objc func options() {
        viewController.options()
    }
    
    @objc func openSlideShow() {
        viewController.openSlideShow()
    }

}

