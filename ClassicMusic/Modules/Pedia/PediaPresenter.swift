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
    
    func loadPediaData() -> [PediaData]? {
        return interactor.loadPediaData()
    }
    
    
    // MARK: - Router
    func certainTitleIsPicked(index: Int, pickedFilter: String) {
        var data = Data.articleData[index]
        if pickedFilter == "favorites" {
            let list = Data.getLikedArticles()
            print("Finding problem", list)
            guard list.count > index else {
                print("Still same problem with routing and array")
                return
            }
            data = list[index]
        }
        router.openArticle(index: index, data: data)
    }

}
