//
//  AppDelegate.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        if PullUpProgression.pulseCheck == nil {
            window?.rootViewController = GoatspyngaitAnalysis()//ACDOntagonistMuscle()
        }else{
            window?.rootViewController =  GoatspyngaitAnalysis()
        }
        
        window?.makeKeyAndVisible()
        return true
    }

  

}

