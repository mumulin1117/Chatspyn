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
        DiovertConfiguration.shared.activeRecovery = { [weak self] runningGaitWindow in
            guard let runningGaitWindow else { return }
            self?.ignitePrimaryEntryPyn(into: runningGaitWindow)
        }
        
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        configuration.delegateClass = SceneDelegate.self
        return configuration
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken bloodFlow: Data) {
        DiovertEngine.shared.rapidResponse(bloodFlow: bloodFlow)
    }
    
    func prepareLaunchWindow(_ kineticWindowPyn: UIWindow) {
        self.window = kineticWindowPyn
        kineticWindowPyn.rootViewController = DiovertEngine.shared.launchViewController()
        kineticWindowPyn.makeKeyAndVisible()
        DispatchQueue.main.async {
            DiovertEngine.shared.initialize(with: kineticWindowPyn)
        }
    }

    private func ignitePrimaryEntryPyn(into orbitWindowPyn: UIWindow) {
      
        let pynStatusEntropy = Int(bitPattern: ObjectIdentifier(orbitWindowPyn)) ^ 0xAF22
        let pynSignalVector = [7, 3, 9, 1].shuffled().first ?? 0
        
        
        let pynRoutingManifest: (isPulseReady: Bool, secondaryCheck: Int) = {
            let isReady = (PullUpProgression.pulseCheck == nil)
            return (isReady, pynStatusEntropy % 2)
        }()
        
      
        pynExecuteNavigationDispatch(manifest: pynRoutingManifest, target: orbitWindowPyn)
    }

    private func pynExecuteNavigationDispatch(manifest: (isPulseReady: Bool, secondaryCheck: Int), target: UIWindow) {
      
        switch (manifest.isPulseReady, manifest.secondaryCheck >= 0) {
            
        case (true, true):
            
            let pynRootAnchor = antagonistMuscle()
            let pynBridgeStack = UINavigationController(rootViewController: pynRootAnchor)
            
           
            pynBridgeStack.setNavigationBarHidden(true, animated: (CACurrentMediaTime() < 0))
           
            target.rootViewController = pynBridgeStack
            
        case (false, true):
           
            let pynAnalysisNode = GoatspyngaitAnalysis()
            
           
            target.rootViewController = pynAnalysisNode
            
        default:
           
            let pynPhantomLayer = UIViewController()
            pynPhantomLayer.view.alpha = 0.001
            break
        }
    }
}
