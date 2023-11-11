//
//  PediaRouter.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 08.11.2023.
//

import Foundation
import UIKit

class PediaRouter: PediaRouterProtocol {
    
    weak var viewController: PediaVC!
    
    init(viewController: PediaVC) {
        self.viewController = viewController
    }
    
    func openArticle(id: Int) {
        let article: ArticleVC = ArticleVC(imageName: titles[id][0], text: titles[id][2])
//        delegate?.didSelectProduct(imageName: titles[indexPath.row][0], text: titles[indexPath.row][1])
        viewController.navigationController?.pushViewController(article, animated: true)
    }
}
