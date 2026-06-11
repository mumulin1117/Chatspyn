import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let kineticWindowPyn = UIWindow(windowScene: windowScene)
        kineticWindowPyn.frame = windowScene.coordinateSpace.bounds
        window = kineticWindowPyn
        (UIApplication.shared.delegate as? AppDelegate)?.prepareLaunchWindow(kineticWindowPyn)
    }
}
