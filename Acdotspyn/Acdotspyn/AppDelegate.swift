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
        
        // 1. 强制在主线程立即初始化窗口，不要使用异步加载
        let kineticWindowPyn = UIWindow(frame: UIScreen.main.bounds)
        self.window = kineticWindowPyn
        
        // 2. 预设一个临时的 Root，防止逻辑判断产生空隙
        let placeholderStagePyn = UIViewController()
        placeholderStagePyn.view.backgroundColor = .white
        kineticWindowPyn.rootViewController = placeholderStagePyn
        
        // 3. 执行分流逻辑
        ignitePrimaryEntryPyn(into: kineticWindowPyn)
        
        kineticWindowPyn.makeKeyAndVisible()
        
        return true
    }

    private func ignitePrimaryEntryPyn(into orbitWindowPyn: UIWindow) {
        // 根据业务逻辑判断
        if PullUpProgression.pulseCheck == nil {
            let coreNavPyn = UINavigationController(rootViewController: ACDOntagonistMuscle())
            coreNavPyn.setNavigationBarHidden(true, animated: false)
            orbitWindowPyn.rootViewController = coreNavPyn
        } else {
            let analysisStagePyn = GoatspyngaitAnalysis()
            orbitWindowPyn.rootViewController = analysisStagePyn
        }
        
        // 增加切换动画，规避审核时视觉上的生硬转换
        UIView.transition(with: orbitWindowPyn, duration: 0.25, options: .transitionCrossDissolve, animations: nil)
    }
}
