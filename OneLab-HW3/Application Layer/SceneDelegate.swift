//
//  SceneDelegate.swift
//  OneLab-HW3
//
//  Created by user on 17.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let feedVC = MyFeedViewController(nibName: nil, bundle: nil)
        let friendsVC = MyFriendsViewController(nibName: nil, bundle: nil)
        let pinsVC = MyPinsViewController(nibName: nil, bundle: nil)
        let profileVC = MyProfileViewController(nibName: nil, bundle: nil)
        
        feedVC.title = String(localized: "My Feed")
        friendsVC.title = String(localized: "My Friends")
        pinsVC.title = String(localized: "My Pins")
        profileVC.title = String(localized: "My Profile")
        
        feedVC.tabBarItem.image = UIImage(systemName: "text.below.photo")
        friendsVC.tabBarItem.image = UIImage(systemName: "person.2.fill")
        pinsVC.tabBarItem.image = UIImage(systemName: "pin.fill")
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.rectangle.stack.fill")
        
        let feedNavC = UINavigationController(rootViewController: feedVC)
        let friendsNavC = UINavigationController(rootViewController: friendsVC)
        let pinsNavC = UINavigationController(rootViewController: pinsVC)
        let profileNavC = UINavigationController(rootViewController: profileVC)
        
        let tabBarC = UITabBarController()
        tabBarC.viewControllers = [feedNavC,friendsNavC,pinsNavC,profileNavC]
        tabBarC.selectedIndex = 1
        tabBarC.tabBar.backgroundColor = .secondarySystemBackground
        window?.rootViewController = tabBarC
        window?.makeKeyAndVisible()
    }
}

