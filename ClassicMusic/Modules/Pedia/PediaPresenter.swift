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
    
    func configureView() {
        view.setupUI()
    }
    
    // MARK: - Interactor
    func loadCertainTitle(id: Int, for cell: TitleCell, data: PediaData) {
        interactor.loadAttributesForTitle(id: id, for: cell, data: data)
    }
    
    func filterData(parameter: String) {
        interactor.filterData(parameter: parameter)
        view.dataSource.dataSource = Data.pediaData
    }
    
    
    // MARK: - Router
    func certainTitleIsPicked(index: Int) {
        let data = Data.articleData[index]
        router.openArticle(index: index, data: data)
    }
    
    func loadPediaData() -> [PediaData]? {
        return interactor.loadPediaData()
    }
    
}
