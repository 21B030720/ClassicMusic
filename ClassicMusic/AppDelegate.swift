//
//  AppDelegate.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 24.07.2023.
//

import UIKit
//import FirebaseCore
//import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = UIWindow()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        let discoverVC = PediaVC() as UIViewController
        let discoverVC = TabBar() as UITabBarController
        let navigationController = UINavigationController(rootViewController: discoverVC)
        navigationController.navigationBar.isTranslucent = false
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
//        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
//    func connectFirebase() {
//        print("Firebase is connected")
//        Auth.auth().createUser(withEmail: "jacklol@gmail.com", password: "aaaaaaaaa") { [weak self] result, error in
//            guard let userId = result?.user.uid else {
//                print(error)
//                return
//            }
//
//            let newUser = User(id: userId,
//                               name: "Arslan",
//                               email: "jacklol@gmail.com",
//                               joined: Date().timeIntervalSince1970)
//
//            let db = Firestore.firestore()
//
//            db.collection("users")
//                .document(userId)
//                .setData(newUser.asDictionary())
//            print("Firebase is connected 2")
//
//        }
//        print("Firebase is connected 3")
//    }
    

    

}


