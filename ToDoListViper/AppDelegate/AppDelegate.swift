//
//  AppDelegate.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let todoListView = TodoListBuilder().provide()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = todoListView
        window?.makeKeyAndVisible()
        
        return true
    }
}

