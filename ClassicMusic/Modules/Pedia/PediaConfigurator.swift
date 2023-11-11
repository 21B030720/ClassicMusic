//
//  PediaConfigurator.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 08.11.2023.
//

import Foundation
import UIKit


class PediaConfigurator: PediaConfiguratorProtocol {
    
    func configure(viewController: PediaVC) {
        let presenter = PediaPresenter(view: viewController)
        let interactor = PediaInteractor(presenter: presenter)
        let router = PediaRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
