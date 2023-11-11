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
    
    var data = Data()
    
    init(presenter: PediaPresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadAttributesForTitle(id: Int, for cell: TitleCell) {
        cell.labelView.text = titles[id][1]
        cell.imageView.image = UIImage(named: titles[id][0])
    }
    

}
