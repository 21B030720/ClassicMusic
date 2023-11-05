//
//  ArticleVC.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 04.08.2023.
//

import UIKit
import AVKit
import AVFoundation
import SnapKit


//ViewControllerDelegate
class ArticleVC: UIViewController, AVAssetResourceLoaderDelegate {
    // MARK: - Attributes
    let status = "+"
    let scroller: UIScrollView = UIScrollView()
    var imageView: UIImageView // Image of Person
    var label: UILabel // Text about Person
    let player: PlayerView = PlayerView()
    let buttonSlideShow: UIButton = {
        let content = UIButton()
        content.setTitle("SlideShow", for: .normal)
        content.backgroundColor = .red
        content.addTarget(self, action: #selector(openSlideShow), for: .touchUpInside)
        return content
    }()
    
    
    // MARK: - Init
    init(imageName: String, text: String) {
        imageView = UIImageView(image: UIImage(named: imageName))
        label = UILabel()
        label.text = text
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Operations
    func setupUI() {
        // Scroller
        view.addSubview(scroller)
        scroller.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-150)
            make.bottom.width.equalToSuperview()
        }
        let currentWidth = self.view.frame.size.width
        let width = currentWidth - 100
        let currentHeight = currentWidth * (imageView.image!.size.height / imageView.image!.size.width)
        let height = width * (imageView.image!.size.height / imageView.image!.size.width)
        // Image
        scroller.addSubview(imageView)
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.opacity = 0.3
        imageView.snp.makeConstraints { make in
            make.top.equalTo(scroller.snp.top)
            make.leading.equalTo(scroller.snp.leading)
            make.width.equalTo(scroller.snp.width)
            make.height.equalTo(currentHeight)
        }
        // Label
        scroller.addSubview(label)
        label.numberOfLines = 0
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalTo(scroller.snp.leading).offset(20)
            make.width.equalTo(width + 60)
        }
        // Player
        scroller.addSubview(player)
        player.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.leading.equalTo(scroller.snp.leading).offset(20)
            make.width.equalTo(width+60)
            make.height.equalTo(60)
            make.bottom.equalTo(scroller.snp.bottom)
        }
        // Slide SHow Button
        imageView.addSubview(buttonSlideShow)
        buttonSlideShow.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(100)
            make.leading.equalTo(imageView.snp.leading).offset(50)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        // Navbar Buttons
//        view.addSubview(buttonSlideShow)
        let firstButtonItem = UIBarButtonItem(title: status, style: .plain, target: self, action: #selector(like))
        let font = UIFont.systemFont(ofSize: 30)
        firstButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        space.width = 40
        let secondButtonItem = UIBarButtonItem(title: "Slide Show", style: .plain, target: self, action: #selector(openSlideShow))
        navigationItem.rightBarButtonItems = [
            firstButtonItem,
            space,
            secondButtonItem
        ]
        
    }
    
    @objc func openSlideShow() {
        let slideShowVC = SlideShowVC(text: label.text!)
        navigationController?.pushViewController(slideShowVC, animated: true)
    }
    
    @objc func like() {
        
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
