//
//  AppDelegate.swift
//  Batman
//
//  Created by UNION on 27/03/2021.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //DISPLAY LAUNCH VIEW FOR APP
        window = UIWindow()
        window?.makeKeyAndVisible()
        let nav = UINavigationController(rootViewController: AllBatmanMoviesHomeVC())
        window?.rootViewController = nav
      
        return true
    }




}

