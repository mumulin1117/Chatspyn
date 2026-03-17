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
       
        let kineticWindowPyn = UIWindow(frame: UIScreen.main.bounds)
        self.window = kineticWindowPyn
     
        let placeholderStagePyn = UIViewController()
        placeholderStagePyn.view.backgroundColor = .white
        kineticWindowPyn.rootViewController = placeholderStagePyn
     
        ignitePrimaryEntryPyn(into: kineticWindowPyn)
        
        kineticWindowPyn.makeKeyAndVisible()
        
        return true
    }

    private func ignitePrimaryEntryPyn(into orbitWindowPyn: UIWindow) {
    
        if PullUpProgression.pulseCheck == nil {
            let coreNavPyn = UINavigationController(rootViewController: ACDOntagonistMuscle())
            coreNavPyn.setNavigationBarHidden(true, animated: false)
            orbitWindowPyn.rootViewController = coreNavPyn
        } else {
            let analysisStagePyn = GoatspyngaitAnalysis()
            orbitWindowPyn.rootViewController = analysisStagePyn
        }
        
        UIView.transition(with: orbitWindowPyn, duration: 0.25, options: .transitionCrossDissolve, animations: nil)
    }
}
