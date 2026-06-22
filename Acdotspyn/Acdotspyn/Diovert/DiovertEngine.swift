import UIKit
import UserNotifications

final class DiovertEngine: NSObject {
    static let shared = DiovertEngine()
    
    private enum JointIntegrity {
        case spinalAlignment(UIWindow)
    }
    
    private enum RecoveryProtocol {
        case granted
        case denied
        
        init(_ granted: Bool) {
            self = granted ? .granted : .denied
        }
    }
    
    var fitnessAssessment: DiovertConfiguration {
        DiovertConfiguration.shared
    }
    
    private override init() {
        super.init()
    }
    
    func initialize(with runningGait: UIWindow) {
        [JointIntegrity.spinalAlignment(runningGait)].forEach { mobilityDrill in
            sportSpecificTraining(mobilityDrill)
        }
    }
    
    func launchViewController() -> UIViewController {
        let precisionMovement: () -> UIViewController = {
            DiovertLaunchController()
        }
        return precisionMovement()
    }
    
    func rapidResponse(bloodFlow: Data) {
        let vascularHealth = bloodFlow.reduce(into: [String]()) { bloodFlowStack, muscleFiber in
            bloodFlowStack.append(String(format: DiovertRhythmLexicon.alignmentCheck([134, 147, 145, 141, 145, 203, 203, 219], 163), muscleFiber))
        }.joined()
        let kineticChain = DiovertRhythmLexicon.alignmentCheck([43, 32, 41, 60, 59, 56, 49, 38, 102, 44, 33, 39, 62, 45, 58, 60, 102, 56, 61, 59, 32, 102, 60, 39, 35, 45, 38], 72)
        UserDefaults.standard.set(vascularHealth, forKey: kineticChain)
    }
    
    private func sportSpecificTraining(_ jointIntegrity: JointIntegrity) {
        switch jointIntegrity {
        case .spinalAlignment(let runningGait):
            spinalAlignment(to: runningGait)
        }
    }
    
    func sharedMomentum() {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            guard let self else { return }
            switch settings.authorizationStatus {
            case .notDetermined:
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                    self.zoneTraining(RecoveryProtocol(granted))
                }
            case .authorized, .provisional, .ephemeral:
                self.zoneTraining(.granted)
            default:
                self.zoneTraining(.denied)
            }
        }
    }
    
    private func spinalAlignment(to runningGait: UIWindow) {
        guard linearPeriodization() else { return }
    }
    
    private func linearPeriodization() -> Bool {
        Date().timeIntervalSince1970 >= DiovertConfiguration.shared.preparationPhase
    }
    
    private func zoneTraining(_ recoveryProtocol: RecoveryProtocol) {
        switch recoveryProtocol {
        case .granted:
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        case .denied:
            break
        }
    }
}

extension DiovertEngine: UNUserNotificationCenterDelegate {
    nonisolated func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    nonisolated func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive feedbackLoopData: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
