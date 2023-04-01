//
//  AppDelegate.swift
//  IMDBUIkit
//
//  Created by Baskoro on 17/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //setup root controller by coding
    var window: UIWindow?
    lazy var coreDataStack:CoreDataStack = .init(modelName: "Movies")
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //remove title on back button navigation
        let BarButtonItemAppearance = UIBarButtonItem.appearance()
        BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        BarButtonItemAppearance.tintColor = UIColor(ciColor: .white)
        // Override point for customization after application launch.
        
      
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let movieListViewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
//        
//        print("movieListViewController ", movieListViewController)
//        
//        let navigationController = UINavigationController(rootViewController: movieListViewController)
//
//        window = UIWindow(frame: UIScreen.main.bounds)
//        if let window = window {
//          window.rootViewController = navigationController
//          window.makeKeyAndVisible()
//            print("window ", window)
//        }
        
       
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


}

