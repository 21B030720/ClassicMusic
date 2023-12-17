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
//        guard let image = UIImage(named: data.image) else {
//            print("fixing image size bag is wrong 1")
//            return
//        }
//
//        let width = (UIScreen.main.bounds.width - 40) / 2 - 20
//        let height = width * (image.size.height / image.size.width) + 100
//        
//        let size: CGSize = CGSize(width: width, height: height)
//        
//        cell.imageSize = size
        cell.labelView.text = data.name
        cell.imageView.image = UIImage(named: data.image)
//        cell.labelView.text = titles[id][1]
//        cell.imageView.image = UIImage(named: titles[id][0])
    }
    
    func loadPediaData() -> [PediaData]? {
        return Data.getPediaData()
    }
    
    func filterData(parameter: String) {
        Data.filterPediaBy(parameter: parameter)
    }
    
    

}
