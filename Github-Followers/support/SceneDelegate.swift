//
//  SceneDelegate.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/11/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window=UIWindow(frame:windowScene.coordinateSpace.bounds)
        window?.windowScene=windowScene
        window?.rootViewController=createTabBarController()
        window?.makeKeyAndVisible()	
        
        
        
    }
    func createSearchNC()->UINavigationController{
        let searchVC=SearchVC()
        searchVC.title="Search"
        searchVC.modalPresentationStyle = .fullScreen
        searchVC.tabBarItem=UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavouritesNC()->UINavigationController{
        let favouritesVC=FavouritesVC()
        favouritesVC.modalPresentationStyle = .fullScreen
        favouritesVC.title="Favourites"
        
        let barItem=UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        favouritesVC.tabBarItem=barItem
        return UINavigationController(rootViewController: favouritesVC)
    }
    
    func createTabBarController() ->UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers=[createSearchNC(),createFavouritesNC()]
        
        UITabBar.appearance().barTintColor = UIColor.orange
        
        return tabBar
    }
    
    
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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
    }
    
    
}

