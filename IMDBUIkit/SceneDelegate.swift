//
//  SceneDelegate.swift
//  IMDBUIkit
//
//  Created by Baskoro on 17/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        //set the main entry point by code
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let movieListViewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        let movieListSavedViewController =  storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        
        //add bottom bar item
        let homeItem = UITabBarItem()
        homeItem.title = "Home"
        
        let savedItem = UITabBarItem()
        savedItem.title = "Saved Movie"
//        item.image = UIImage(named: "home_icon")
        
        movieListViewController.tabBarItem = homeItem
        movieListSavedViewController.tabBarItem = savedItem
//        let homeVC = HomeViewController()
//        homeVC.tabBarItem = item
        
        //add bottom bar container
        let tabBarContainer = UITabBarController()
        tabBarContainer.viewControllers = [movieListViewController, movieListSavedViewController]
        
        let navigationController = UINavigationController(rootViewController: tabBarContainer)
//        navigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)
//        navigationController
        
//        navigationController.tabBarItem =
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
//        AppDelegate().coreDataStack
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.coreDataStack.saveContext()
    }


}

