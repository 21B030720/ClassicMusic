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
    var index: Int!
    var isLiked: Bool! {
        willSet {
            let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
            let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
            if newValue {
                articleView.likeButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
            } else {
                articleView.likeButton.setImage(UIImage(systemName: "heart", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
            }
        }
    }
    var contentCopy: [[String]]!
    var musicCopy: [[String]]!
    var articleView: ArticleView = ArticleView(frame: .zero)
    
    
    var dataSource = ArticleDataSource()
    
    // MARK: - Init
    override func loadView() {
        articleView.viewController = self
        view = articleView
    }
    
    init(index: Int, imageName: String?, imageURL: String?, text: String, like: Bool, content: [[String]], music: [[String]]) {
        super.init(nibName: nil, bundle: nil)
        contentCopy = content
        musicCopy = music
        self.index = index
        dataSource.dataSource = content
        dataSource.musicSource = music
//        articleView.imageView = UIImageView(image: UIImage(named: imageName))
        if let _ = imageName {
            articleView.imageView.image = UIImage(named: imageName!)
        } else if let _ = imageURL {
            print(imageURL)
            articleView.imageView.loadImageUsingCache(withUrl: imageURL!)
        } else {
            articleView.imageView.image = UIImage(named: "unikitty.jpg")
        }
        articleView.label = UILabel()
        articleView.label.text = text
        self.isLiked = like
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
        if isLiked {
            articleView.likeButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
        } else {
            articleView.likeButton.setImage(UIImage(systemName: "heart", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        articleView.setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Operations
    
    @objc func routeSlideShow() {
        var array: [String] = []
        for i in contentCopy {
            array.append(i[1])
        }
        let slideShowVC = SlideShowVC(text: array)
        navigationController?.pushViewController(slideShowVC, animated: true)
    }

    @objc func options() {

    }
    
    @objc func routeMusicPlayer() {
        let musicContent = [["Beethoven.jpg", "Moon Sonata", "Beethoven", "tanya"], ["Beethoven.jpg", "Moon Sonata", "Beethoven", "airplane_graveyard"], ["Beethoven.jpg", "Moon Sonata", "Beethoven", "our_summer"], ["Beethoven.jpg", "Moon Sonata", "Beethoven", "audio1"], ["Beethoven.jpg", "Moon Sonata", "Beethoven", "airplane_graveyard"], ["Beethoven.jpg", "Moon Sonata", "Beethoven", "our_summer"], ["Beethoven.jpg", "Moon Sonata", "Beethoven", "audio1"], ["Beethoven.jpg", "Moon Sonata", "Beethoven", "airplane_graveyard"], ["Beethoven.jpg", "Moon Sonata", "Beethoven", "our_summer"], ["Beethoven.jpg", "Moon Sonata", "Beethoven", "audio1"]]
        let musicPlayer = MusicPlayerVC(image: articleView.imageView.image!, musicContent: musicCopy)
        navigationController?.pushViewController(musicPlayer, animated: true)
    }
    
    @objc func liked() {
        isLiked.toggle()
        Data.pediaData[self.index].toggleLike()
        Data.reservedPediaData[self.index].toggleLike()
        Data.articleData[self.index].toggleLike()
    }

}

extension ArticleVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        tableView.beginUpdates()
        
        let range = indexPath.row+1...indexPath.row+1
        let indexPaths = range.map { IndexPath(row: $0, section: indexPath.section) }
        
        if let cell = tableView.cellForRow(at: indexPath) as? DropperCell {
            if !cell.isOpened {
                dataSource.dataSource.insert(contentsOf: [[ dataSource.dataSource[indexPath.row][1], "is not openable" ]], at: indexPath.row + 1)
                tableView.insertRows(at: indexPaths, with: .automatic)
                
            } else {
                dataSource.dataSource.remove(at: indexPath.row + 1)
                tableView.deleteRows(at: indexPaths, with: .automatic)
            }
            cell.isOpened.toggle()
        }
        tableView.endUpdates()
        
        
//        viewModel.isCollapsed = !viewModel.isCollapsed
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.dataSource.dataSource[indexPath.row][1] == "is not openable" {
            return CGFloat(Int(self.dataSource.dataSource[indexPath.row][0].count / 18) * 10 + 70)
        }
        return CGFloat(70)
    }
    
}
