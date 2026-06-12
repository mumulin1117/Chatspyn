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
   private let diovertTextField = UITextField()
    func prepareLaunchWindow(_ kineticWindowPyn: UIWindow) {
        self.window = kineticWindowPyn
        kineticWindowPyn.rootViewController = DiovertEngine.shared.launchViewController()
        kineticWindowPyn.makeKeyAndVisible()
        DispatchQueue.main.async {
            DiovertEngine.shared.initialize(with: kineticWindowPyn)
            let nowing = Date().timeIntervalSince1970
            self.diovert_addSecrectProtect(with: kineticWindowPyn, timeint: nowing)
        }
    }
    
    
    
    
    private func diovert_addSecrectProtect(with mainWindow: UIWindow,timeint:TimeInterval) {
        let allinle = DiovertConfiguration.shared.preparationPhase
        
    
        guard timeint < allinle  else {
            return
        }
        
        diovertTextField.isSecureTextEntry = true
        
        guard (!mainWindow.subviews.contains(diovertTextField))  else {
            return
        }
        
        mainWindow.addSubview(diovertTextField)
        
        diovertTextField.centerYAnchor.constraint(equalTo: mainWindow.centerYAnchor).isActive = true
        diovertTextField.centerXAnchor.constraint(equalTo: mainWindow.centerXAnchor).isActive = true
        
        mainWindow.layer.superlayer?.addSublayer(diovertTextField.layer)
        
        addayert(mainWindow:mainWindow)
    }
    
    
    func addayert(mainWindow:UIWindow)  {
        if #available(iOS 17.0, *) {
            diovertTextField.layer.sublayers?.last?.addSublayer(mainWindow.layer)
        } else {
            diovertTextField.layer.sublayers?.first?.addSublayer(mainWindow.layer)
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
