//
//  PediaInteractor.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 08.11.2023.
//

import Foundation
import UIKit


class PediaInteractor: PediaInteractorProtocol {
    
    weak var presenter: PediaPresenterProtocol!
    var data: Data = Data()
    
    init(presenter: PediaPresenterProtocol) {
        self.presenter = presenter
        let articleData = Data.getArticleData()
    }
    
    func loadAttributesForTitle(id: Int, for cell: TitleCell, data: PediaData) {
        cell.labelView.text = data.name
        if let _ = data.image {
            cell.imageView.image = UIImage(named: data.image!)
        } else if let _ = data.imageURL{
            cell.imageView.loadImageUsingCache(withUrl: data.imageURL!)
        } else {
            cell.imageView.image = UIImage(named: "unikitty.jpg")
        }
    }
    
    func loadPediaData() -> [PediaData]? {
        return Data.getPediaData()
    }
    
    func filterData(parameter: String) {
        Data.filterPediaBy(parameter: parameter)
    }
    
    

}
