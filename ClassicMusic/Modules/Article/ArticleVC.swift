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
    var articleView: ArticleView = ArticleView(frame: .zero)


    // MARK: - Init
    override func loadView() {
        articleView.viewController = self
        view = articleView
    }
    
    init(imageName: String, text: String) {
        articleView.imageView = UIImageView(image: UIImage(named: imageName))
        articleView.label = UILabel()
        articleView.label.text = text
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        articleView.setupUI()
        view.backgroundColor = .white
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Operations
    
    @objc func openSlideShow() {
        let slideShowVC = SlideShowVC(text: articleView.label.text!)
        navigationController?.pushViewController(slideShowVC, animated: true)
    }

    @objc func options() {

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
