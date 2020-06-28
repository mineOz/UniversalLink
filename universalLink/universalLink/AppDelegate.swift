//
//  AppDelegate.swift
//  universalLink
//
//  Created by Mine Oz on 31.05.2020.
//  Copyright © 2020 mobilerdev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // Get URL components from the incoming user activity
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let incomingURL = userActivity.webpageURL,
            let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true) else {
                return false
        }
        
        // Check for specific URL components that you need
        guard let _ = components.path,
            let params = components.queryItems else {
                return false
        }
        
        if let productName = params.first(where: { $0.name == "productName" } )?.value {
            presentDetailViewController(productName)
            return true
            
        } else {
            print("Either product name missing")
            return false
        }
        
    }
  
    func presentDetailViewController(_ product: String) {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      
      guard
        let detailVC = storyboard
          .instantiateViewController(withIdentifier: "DetailController")
            as? DetailViewController,
        let navigationVC = storyboard
          .instantiateViewController(withIdentifier: "NavigationController")
            as? UINavigationController
      else { return }
      
      detailVC.selectedProduct = product
      navigationVC.modalPresentationStyle = .formSheet
      navigationVC.pushViewController(detailVC, animated: true)
    }
}

