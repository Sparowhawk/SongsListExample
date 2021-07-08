//
//  AppDelegate.swift
//  MusicList
//
//  Created by Dylan Nienberg on 7/8/21.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let itunesAPISharedHandler:ItunesAPIHandler = ItunesAPIHandler()
    let dateFormatter:DateUtils = DateUtils()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.window = UIWindow()
        self.window!.rootViewController = UINavigationController(rootViewController:  ArtistViewController())
        self.window!.makeKeyAndVisible()
        return true
    }
}
