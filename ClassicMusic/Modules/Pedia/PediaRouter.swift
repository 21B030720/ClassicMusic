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
    
    func openArticle(index: Int, data: ArticleData) {
        let article: ArticleVC = ArticleVC(
            index: index,
            imageName: data.image,
            imageURL: data.imageURL,
            text: data.name,
            like: data.like,
            content: data.readingContent,
            music: data.musicContent
        )
//        delegate?.didSelectProduct(imageName: titles[indexPath.row][0], text: titles[indexPath.row][1])
        viewController.tabBarController?.tabBar.isHidden = true
//        article.hidesBottomBarWhenPushed = true
        viewController.navigationController?.pushViewController(article, animated: true)
    }
}
