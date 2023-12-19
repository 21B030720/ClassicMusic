//
//  TabBar.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 06.11.2023.
//

import UIKit

class TabBar: UITabBarController {
    var firstNavigationController: PediaVC!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let appearance = UITabBarAppearance()
//        appearance.backgroundColor = .blue
//        tabBar.standardAppearance = appearance
        self.setupTabs()
        
        self.tabBar.barTintColor = #colorLiteral(red: 0.5803921569, green: 0.4941176471, blue: 0.4941176471, alpha: 1)
        self.tabBar.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.4941176471, blue: 0.4941176471, alpha: 1)
        tabBar.unselectedItemTintColor = .blue
        tabBar.unselectedItemTintColor = .white
    }
    
    private func setupTabs() {
        let rootOfPedia = PediaVC()
        let pedia = self.createNAvBar(with: "Pedia", and: UIImage(systemName: "book.fill"), vc: rootOfPedia)
        firstNavigationController = rootOfPedia
        let creator = self.createNAvBar(with: "Creator", and: UIImage(systemName: "plus.diamond.fill"), vc: CreatorVC())
        let profile = self.createNAvBar(with: "Profile", and: UIImage(systemName: "figure.stand"), vc: ProfileVC())
        self.setViewControllers([pedia, creator, profile], animated: true)
    }

    private func createNAvBar(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return nav
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}




