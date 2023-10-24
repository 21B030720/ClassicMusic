//
//  ArticleVC.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 04.08.2023.
//

import UIKit
import AVKit
import AVFoundation


//ViewControllerDelegate
class ArticleVC: UIViewController, AVAssetResourceLoaderDelegate {
    // MARK: - Attributes
    let scroller: UIScrollView = UIScrollView()
    var imageView: UIImageView // Image of Person
    var label: UILabel // Text about Person
    let player: PlayerView = PlayerView()
    
    
    // MARK: - Init
    init(imageName: String, text: String) {
        imageView = UIImageView(image: UIImage(named: imageName))
        label = UILabel()
        label.text = text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        setupScroller()
        view.backgroundColor = .white
    }
    
    // MARK: - Operations
    func setupUI() {
        view.addSubview(scroller)
        scroller.translatesAutoresizingMaskIntoConstraints = false
        let currentWidth = self.view.frame.size.width
        let width = currentWidth - 100
        let height = width * (imageView.image!.size.height / imageView.image!.size.width)
        // Image
        scroller.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // Label
        scroller.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        // Player
        scroller.addSubview(player)
        player.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scroller.topAnchor.constraint(equalTo: view.topAnchor),
            scroller.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scroller.widthAnchor.constraint(equalTo: view.widthAnchor),
            // Image
            imageView.topAnchor.constraint(equalTo: scroller.topAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: scroller.leadingAnchor, constant: 50),
            imageView.widthAnchor.constraint(equalToConstant: width),
            imageView.heightAnchor.constraint(equalToConstant: height),
            // Text
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: scroller.leadingAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: width + 60),
//            label.bottomAnchor.constraint(equalTo: scroller.bottomAnchor),
            // Player
            player.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            player.leadingAnchor.constraint(equalTo: scroller.leadingAnchor, constant: 20),
            player.widthAnchor.constraint(equalToConstant: width + 60),
            player.heightAnchor.constraint(equalToConstant: 60),
            player.bottomAnchor.constraint(equalTo: scroller.bottomAnchor),
        ])
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
