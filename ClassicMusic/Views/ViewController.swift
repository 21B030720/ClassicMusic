//
//  ViewController.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 24.07.2023.
//

import UIKit


protocol ViewControllerDelegate {
//    func didSelectProduct(imageName: String, text: String)
}

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

//    var delegate: ViewControllerDelegate?
    
    var collection: UICollectionView!
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        let layout = UICollectionViewFlowLayout()
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // Collection Constraints
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40).isActive = true
        collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
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
    }
    
    func onTap(indexPath: IndexPath) {
        let article: ArticleVC = ArticleVC(imageName: titles[indexPath.row][0], text: titles[indexPath.row][2])
//        delegate?.didSelectProduct(imageName: titles[indexPath.row][0], text: titles[indexPath.row][1])
        navigationController?.pushViewController(article, animated: true)
    }
    

}



class TitleCell: UICollectionViewCell {
//    let content: UIImageView = UIImageView()
    let content: UIView = UIView()
    let imageView: UIImageView = UIImageView()
    let labelView: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        content.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        content.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 100).isActive = true
        content.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        
        content.addSubview(imageView)
        content.addSubview(labelView)
        setupImageView()
        setupTextView()
        
    }
    
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: content.leftAnchor, constant: 10).isActive = true
        imageView.topAnchor.constraint(equalTo: content.topAnchor).isActive = true
//        imageView.rightAnchor.constraint(equalTo: content.rightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: bounds.width ).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: bounds.height - 100).isActive = true
    }
    
    func setupTextView() {
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.leftAnchor.constraint(equalTo: content.leftAnchor).isActive = true
        labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        labelView.rightAnchor.constraint(equalTo: content.rightAnchor).isActive = true
        labelView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been emplemented")
    }
}

