//
//  PediaProtocols.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 08.11.2023.
//

import Foundation

protocol PediaViewControllerProtocol: class {
    func setupCollectionView()
}

protocol PediaConfiguratorProtocol: class {
    func configure(viewController: PediaVC)
}

protocol PediaPresenterProtocol: class {
    func certainTitleIsPicked(id: Int)
    func configureView()
    func loadCertainTitle(id: Int, for cell: TitleCell)
}

protocol PediaInteractorProtocol: class {
    func loadAttributesForTitle(id: Int, for cell: TitleCell)
}

protocol PediaRouterProtocol: class {
    func openArticle(id: Int)
}
