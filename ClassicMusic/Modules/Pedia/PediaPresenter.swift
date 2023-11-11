//
//  PediaPresenter.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 08.11.2023.
//

import Foundation
import UIKit

// Presenter decides what to choose, Interactor or Router
class PediaPresenter: PediaPresenterProtocol {
    
    weak var view: PediaViewControllerProtocol!
    var interactor: PediaInteractorProtocol!
    var router: PediaRouterProtocol!
    
    init(view: PediaViewControllerProtocol) {
        self.view = view
    }
    
    // MARK: - Interactor
    func loadCertainTitle(id: Int, for cell: TitleCell) {
        interactor.loadAttributesForTitle(id: id, for: cell)
    }
    
    
    // MARK: - Router
    func certainTitleIsPicked(id: Int) {
        router.openArticle(id: id)
    }
    
    func configureView() {
        view.setupCollectionView()
    }
    
}
