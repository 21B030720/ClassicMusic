//
//  ViewController.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 24.07.2023.
//

import UIKit
import SnapKit
//import FirebaseFirestore
//import FirebaseAuth


protocol PediaDelegate {
//    func didSelectProduct(imageName: String, text: String)
}

class Pedia: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var collection: UICollectionView!
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Pedia"
        setupUI()
//        connectFirebase()
    }
    
    func setupUI() {
        let layout = UICollectionViewFlowLayout()
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // Collection Constraints
        view.addSubview(collection)
        collection.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-40)
        }
        collection.dataSource = self
        collection.delegate = self
        collection.register(TitleCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    // Number of Cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    // Setup Data of Each Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TitleCell
        cell.imageView.image = UIImage(named: titles[indexPath.row][0])
        cell.labelView.text = titles[indexPath.row][1]
        return cell
    }
    
    // Size of Each Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let image = UIImage(named: titles[indexPath.row][0]) else {
            return .zero
        }
        let width = collectionView.bounds.width / 2 - 20
        let height = width * (image.size.height / image.size.width) + 100
        
        return CGSize(width: width, height: height)
    }
    
    
    

    // OnTap Each Cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onTap(indexPath: indexPath)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func onTap(indexPath: IndexPath) {
        let article: ArticleVC = ArticleVC(imageName: titles[indexPath.row][0], text: titles[indexPath.row][2])
//        delegate?.didSelectProduct(imageName: titles[indexPath.row][0], text: titles[indexPath.row][1])
        navigationController?.pushViewController(article, animated: true)
    }
    

}

