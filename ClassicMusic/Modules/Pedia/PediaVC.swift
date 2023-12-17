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

let filters = ["default", "favorites"]

class PediaVC: UIViewController, PediaViewControllerProtocol  {
    
    var dataSource: PediaDataSource = PediaDataSource()
    var presenter: PediaPresenterProtocol!
    var collection: UICollectionView!
    var configurator: PediaConfiguratorProtocol = PediaConfigurator()
    let filterButton: UIButton = {
        let content = UIButton()
        
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
        content.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
        
        content.addTarget(self, action: #selector(filter), for: .touchUpInside)
        content.backgroundColor = .clear
        return content
    }()
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.configureView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "brown_background")!)
        self.title = "Pedia"
        
        
//        connectFirebase()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setupUI() {
        setupCollectionView()
        setupFilterButton()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundView = UIImageView(image: UIImage(named: "brown_background"))
        // Collection Constraints
        view.addSubview(collection)
        collection.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-40)
        }
        dataSource.view = self
        dataSource.getData()
        collection.dataSource = dataSource
        collection.delegate = self
        collection.register(TitleCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setupFilterButton() {
        //        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        let actionClosure = { (action: UIAction) in
            self.presenter.filterData(parameter: action.title)
            self.collection.reloadData()
            self.collection.updateConstraints()
            self.collection.collectionViewLayout.invalidateLayout()
        }
        var menuChildren: [UIMenuElement] = []
        for i in filters {
            menuChildren.append(UIAction(title: i, handler: actionClosure))
        }
        filterButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        filterButton.showsMenuAsPrimaryAction = true
//        content.changesSelectionAsPrimaryAction = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: filterButton)
    }
    
    @objc func filter() {
        print("type", type(of: filterButton.menu?.children))
//        presenter.filterData(parameter: filterButton.menu?.children)
    }
    
}

extension PediaVC: UICollectionViewDelegateFlowLayout {
    
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
        presenter.certainTitleIsPicked(index: indexPath.row)
    }
    
}
