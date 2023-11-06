//
//  TabBar.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 06.11.2023.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        // Do any additional setup after loading the view.
    }
    
    private func setupTabs() {
        let pedia = self.createNAvBar(with: "Pedia", and: UIImage(systemName: "book.fill"), vc: Pedia())
        let profile = self.createNAvBar(with: "Profile", and: UIImage(systemName: "figure.stand"), vc: ProfileVC())
        self.setViewControllers([pedia, profile], animated: true)
    }
    
    private func createNAvBar(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
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
