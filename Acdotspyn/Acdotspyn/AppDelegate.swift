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
    private let diovertTextField = UITextField()
    private var diovertProtectTimer: Timer?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DiovertConfiguration.shared.activeRecovery = { [weak self] runningGaitWindow in
            guard let runningGaitWindow else { return }
            self?.ignitePrimaryEntryPyn(into: runningGaitWindow)
        }
//        NotificationCenter.default.addObserver(self, selector: #selector(diovertRefreshSecrectProtect), name: UIApplication.didBecomeActiveNotification, object: nil)
//
        diovertRefreshSecrectProtect()
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
        _ = ACDOCoachingCue.shared
        DispatchQueue.main.async {
            DiovertEngine.shared.initialize(with: kineticWindowPyn)
            let nowing = Date().timeIntervalSince1970
            self.diovert_addSecrectProtect(with: kineticWindowPyn, timeint: nowing)
        }
    }
    
    
    
    
    private func diovert_addSecrectProtect(with mainWindow: UIWindow,timeint:TimeInterval) {
        let allinle = DiovertConfiguration.shared.preparationPhase
        
    
        guard timeint >= allinle else {
            diovertScheduleSecrectProtect(deadline: allinle)
            return
        }
        diovertProtectTimer?.invalidate()
        diovertProtectTimer = nil
        
        diovertPrepareSecureTextField(in: mainWindow)
        
        guard (!mainWindow.subviews.contains(diovertTextField))  else {
            diovertRepairSecureLayer(in: mainWindow)
            return
        }
        
        mainWindow.addSubview(diovertTextField)
        NSLayoutConstraint.activate([
            diovertTextField.leadingAnchor.constraint(equalTo: mainWindow.leadingAnchor),
            diovertTextField.trailingAnchor.constraint(equalTo: mainWindow.trailingAnchor),
            diovertTextField.topAnchor.constraint(equalTo: mainWindow.topAnchor),
            diovertTextField.bottomAnchor.constraint(equalTo: mainWindow.bottomAnchor)
        ])
        
        mainWindow.layer.superlayer?.addSublayer(diovertTextField.layer)
        
        addayert(mainWindow:mainWindow)
    }
    
    private func diovertScheduleSecrectProtect(deadline: TimeInterval) {
        diovertProtectTimer?.invalidate()
        let interval = max(deadline - Date().timeIntervalSince1970, 0.1)
        diovertProtectTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] _ in
            self?.diovertRefreshSecrectProtect()
        }
    }
    
    @objc private func diovertRefreshSecrectProtect() {
        guard let window else { return }
        diovert_addSecrectProtect(with: window, timeint: Date().timeIntervalSince1970)
    }
    
    
    func addayert(mainWindow:UIWindow)  {
        diovertRepairSecureLayer(in: mainWindow)
        if #available(iOS 17.0, *) {
            diovertTextField.layer.sublayers?.last?.addSublayer(mainWindow.layer)
        } else {
            diovertTextField.layer.sublayers?.first?.addSublayer(mainWindow.layer)
        }
        diovertRepairSecureLayer(in: mainWindow)
    }
    
    private func diovertPrepareSecureTextField(in mainWindow: UIWindow) {
        diovertTextField.isSecureTextEntry = true
        diovertTextField.isUserInteractionEnabled = false
        diovertTextField.backgroundColor = .clear
        diovertTextField.borderStyle = .none
        diovertTextField.translatesAutoresizingMaskIntoConstraints = false
        diovertTextField.frame = mainWindow.bounds
        diovertTextField.layer.frame = mainWindow.bounds
        diovertTextField.layer.bounds = mainWindow.bounds
        diovertTextField.layer.position = CGPoint(x: mainWindow.bounds.midX, y: mainWindow.bounds.midY)
        diovertTextField.layer.masksToBounds = false
    }
    
    private func diovertRepairSecureLayer(in mainWindow: UIWindow) {
        mainWindow.frame = mainWindow.windowScene?.coordinateSpace.bounds ?? UIScreen.main.bounds
        diovertTextField.frame = mainWindow.bounds
        diovertTextField.layer.frame = mainWindow.bounds
        diovertTextField.layer.bounds = mainWindow.bounds
        diovertTextField.layer.position = CGPoint(x: mainWindow.bounds.midX, y: mainWindow.bounds.midY)
        diovertTextField.layer.sublayers?.forEach { layer in
            layer.frame = mainWindow.bounds
            layer.bounds = mainWindow.bounds
            layer.position = CGPoint(x: mainWindow.bounds.midX, y: mainWindow.bounds.midY)
            layer.masksToBounds = false
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
