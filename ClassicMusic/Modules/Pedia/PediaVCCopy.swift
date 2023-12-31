////
////  ViewController.swift
////  ClassicMusic
////
////  Created by Arslan Toimbekov on 24.07.2023.
////
//
//import UIKit
//import SnapKit
////import FirebaseFirestore
////import FirebaseAuth
//
//
//protocol PediaDelegate {
////    func didSelectProduct(imageName: String, text: String)
//}
//
//class PediaVC: UIViewController, PediaViewControllerProtocol  {
//    let dataSource = PediaDataSource()
//    var presenter: PediaPresenterProtocol!
//    var collection: UICollectionView!
//    var configurator: PediaConfiguratorProtocol = PediaConfigurator()
//    
//    // Init
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configurator.configure(viewController: self)
//        presenter.configureView()
//        view.backgroundColor = UIColor(patternImage: UIImage(named: "brown_background")!)
//        self.title = "Pedia"
//        
////        connectFirebase()
//    }
//    
//    func setupCollectionView() {
//        let layout = UICollectionViewFlowLayout()
//        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collection.backgroundView = UIImageView(image: UIImage(named: "brown_background"))
//        // Collection Constraints
//        view.addSubview(collection)
//        collection.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(50)
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.bottom.equalToSuperview().offset(-40)
//        }
//        collection.dataSource = dataSource
//        dataSource.view = self
//        collection.delegate = self
//        collection.register(TitleCell.self, forCellWithReuseIdentifier: "cell")
//    }
//    
//}
//
//extension PediaVC: UICollectionViewDelegateFlowLayout {
//    
//    // Size of Each Cell
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        guard let image = UIImage(named: titles[indexPath.row][0]) else {
//            return .zero
//        }
//
//        let width = collectionView.bounds.width / 2 - 20
//        let height = width * (image.size.height / image.size.width) + 100
//        
//        return CGSize(width: width, height: height)
//    }
//    
//    // OnTap Each Cell
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.tabBarController?.tabBar.isHidden = true
//        presenter.certainTitleIsPicked(id: indexPath.row)
//    }
//    
//}
