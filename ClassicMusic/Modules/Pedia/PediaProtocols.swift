//
//  PediaProtocols.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 08.11.2023.
//

import Foundation
import UIKit

protocol PediaViewControllerProtocol: class {
    var dataSource: PediaDataSource { get set}
    func setupUI()
    var presenter: PediaPresenterProtocol! { get set }
    var collection: UICollectionView! { get set }
}

protocol PediaConfiguratorProtocol: class {
    func configure(viewController: PediaVC)
}

protocol PediaPresenterProtocol: class {
    func certainTitleIsPicked(index: Int)
    func configureView()
    func loadCertainTitle(id: Int, for cell: TitleCell, data: PediaData)
    func loadPediaData() -> [PediaData]?
    func filterData(parameter: String)
}

protocol PediaInteractorProtocol: class {
    var data: Data { get }
    func loadAttributesForTitle(id: Int, for cell: TitleCell, data: PediaData)
    func loadPediaData() -> [PediaData]?
    func filterData(parameter: String)
}

protocol PediaRouterProtocol: class {
    func openArticle(index: Int, data: ArticleData)
}
