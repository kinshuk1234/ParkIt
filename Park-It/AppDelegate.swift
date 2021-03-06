//
//  AppDelegate.swift
//  Park-It
//
//  Created by Kinshuk Singh on 2018-02-23.
//  Copyright © 2018 Kinshuk. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//            let rootVC = BrowseProductsViewController()
//            let navigationController = UINavigationController(rootViewController: rootVC)
//            let window = UIWindow(frame: UIScreen.main.bounds)
//            window.rootViewController = navigationController;
//            window.makeKeyAndVisible()
//            self.window = window
            FirebaseApp.configure()
            return true
        }
        
        // This method is where you handle URL opens if you are using a native scheme URLs (eg "yourexampleapp://")
        func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
            let stripeHandled = Stripe.handleURLCallback(with: url)
            
            if (stripeHandled) {
                return true
            }
            else {
                // This was not a stripe url, do whatever url handling your app
                // normally does, if any.
            }
            
            return false
        }
        
        // This method is where you handle URL opens if you are using univeral link URLs (eg "https://example.com/stripe_ios_callback")
        func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
            if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
                if let url = userActivity.webpageURL {
                    let stripeHandled = Stripe.handleURLCallback(with: url)
                    
                    if (stripeHandled) {
                        return true
                    }
                    else {
                        // This was not a stripe url, do whatever url handling your app
                        // normally does, if any.
                    }
                }
                
            }
            return false
        }
}

