//
//  AppDelegate.swift
//  Doorbell-bot Native
//
//  Created by Anders Skaalsveen on 02/11/2018.
//  Copyright © 2018 Bakken &/ Bæck. All rights reserved.
//

import Firebase
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}
