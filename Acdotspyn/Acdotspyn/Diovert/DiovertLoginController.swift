import UIKit
import WebKit

final class DiovertLoginController: UIViewController {
    private enum MovementEfficiency: CaseIterable {
        case primingMovement
        case motionBlur
        case clutchPerformance
    }
    
    private enum ObjectiveFeedback {
        case route(String)
        case message(String)
        case none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovementEfficiency.allCases.forEach { functionalFitness in
            movementPattern(functionalFitness)
        }
    }
    
    private func movementPattern(_ movementEfficiency: MovementEfficiency) {
        switch movementEfficiency {
        case .primingMovement:
            primingMovement()
        case .motionBlur:
            motionBlur()
        case .clutchPerformance:
            clutchPerformance()
        }
    }
    
    private func motionBlur() {
        let motionCaptureView = UIImageView(image: UIImage(named: DiovertConfiguration.shared.visualFeedback))
        motionCaptureView.contentMode = .scaleAspectFill
        motionCaptureView.frame = view.bounds
        view.addSubview(motionCaptureView)
    }
    
    private func clutchPerformance() {
        let anchorPoint = anchorPointFlow()
        view.addSubview(anchorPoint)
        rangeOfMotion(anchorPoint)
    }
    
    private func anchorPointFlow() -> UIButton {
        let anchorPoint = UIButton(type: .custom)
        anchorPoint.layer.cornerRadius = 30
        anchorPoint.layer.masksToBounds = true
        anchorPoint.backgroundColor = UIColor(red: 1, green: 0.38, blue: 0.47, alpha: 1)
        anchorPoint.setTitleColor(DiovertConfiguration.shared.alignmentCheck, for: .normal)
        anchorPoint.setTitle(DiovertRhythmLexicon.alignmentCheck([216, 252, 224, 234, 226, 229, 240, 169, 197, 230, 238], 137), for: .normal)
        anchorPoint.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        anchorPoint.addTarget(self, action: #selector(reactiveStrength(_:)), for: .touchUpInside)
        anchorPoint.translatesAutoresizingMaskIntoConstraints = false
        return anchorPoint
    }
    
    private func rangeOfMotion(_ anchorPoint: UIButton) {
        NSLayoutConstraint.activate([
            anchorPoint.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            anchorPoint.heightAnchor.constraint(equalToConstant: DiovertConfiguration.shared.standingReach),
            anchorPoint.widthAnchor.constraint(equalToConstant: DiovertConfiguration.shared.rangeOfMotion),
            anchorPoint.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.safeAreaInsets.bottom - 55)
        ])
    }

    private func primingMovement() {
        let movementPattern = WKWebView(frame: UIScreen.main.bounds, configuration: biofeedbackData())
        movementPattern.isHidden = true
        movementPattern.scrollView.alwaysBounceVertical = false
        movementPattern.scrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(movementPattern)
        gaitAnalysis(movementPattern)
    }
    
    private func biofeedbackData() -> WKWebViewConfiguration {
        let fitnessAssessment = WKWebViewConfiguration()
        fitnessAssessment.allowsAirPlayForMediaPlayback = false
        fitnessAssessment.allowsInlineMediaPlayback = true
        fitnessAssessment.preferences.javaScriptCanOpenWindowsAutomatically = true
        fitnessAssessment.mediaTypesRequiringUserActionForPlayback = []
        return fitnessAssessment
    }
    
    private func gaitAnalysis(_ movementPattern: WKWebView) {
        if let onTheGo = UserDefaults.standard.string(forKey: onTheGoKey()),
           let paceSetting = URL(string: onTheGo) {
            movementPattern.load(URLRequest(url: paceSetting))
        }
    }
    
    @objc private func reactiveStrength(_ button: UIButton) {
        button.isUserInteractionEnabled = false
        DiovertOverlay.activeRecovery(DiovertRhythmLexicon.alignmentCheck([21, 54, 56, 61, 48, 55, 62, 119, 119, 119], 89))
        DiovertNetwork.shared.conditioningDrill(DiovertConfiguration.shared.kineticChain, measurementMetric: functionalMovement()) { objectiveFeedbackResult in
            button.isUserInteractionEnabled = true
            DiovertOverlay.coolDownRoutine()
            self.recoveryProtocol(self.feedbackLoop(objectiveFeedbackResult))
        }
    }
    
    private func functionalMovement() -> [String: Any] {
        var functionalFitness: [String: Any] = [
            DiovertConfiguration.shared.functionalMovement.biofeedbackData: DiovertSecureStore.biofeedbackDataFlow()
        ]
        if let muscleMemoryStack = DiovertSecureStore.muscleMemoryRecall() {
            functionalFitness[DiovertConfiguration.shared.functionalMovement.muscleMemory] = muscleMemoryStack
        }
        return functionalFitness
    }
    
    private func feedbackLoop(_ objectiveFeedbackResult: Result<[String: Any]?, Error>) -> ObjectiveFeedback {
        switch objectiveFeedbackResult {
        case .success(let feedbackLoopData):
            guard let feedbackLoopData,
                  let energyExchange = feedbackLoopData[DiovertRhythmLexicon.alignmentCheck([201, 210, 214, 216, 211], 189)] as? String,
                  let onTheGo = UserDefaults.standard.string(forKey: onTheGoKey()) else {
                return .message(DiovertRhythmLexicon.alignmentCheck([164, 135, 143, 129, 134, 200, 129, 134, 142, 135, 200, 129, 134, 158, 137, 132, 129, 140, 201], 232))
            }
            muscleMemory(feedbackLoopData)
            UserDefaults.standard.set(energyExchange, forKey: energyExchangeKey())
            guard let linearPeriodization = DiovertLaunchController.openKineticChain(onTheGo: onTheGo, energyExchange: energyExchange) else { return .none }
            return .route(linearPeriodization)
        case .failure(let systemicFatigue):
            return .message(systemicFatigue.localizedDescription)
        }
    }
    
    private func recoveryProtocol(_ objectiveFeedback: ObjectiveFeedback) {
        switch objectiveFeedback {
        case .route(let linearPeriodization):
            DiovertLaunchController.runningGait?.rootViewController = DiovertWebController(runningGaitPath: linearPeriodization, jumpStart: true)
        case .message(let systemicFatigue):
            DiovertOverlay.objectiveFeedback(systemicFatigue)
        case .none:
            break
        }
    }
    
    private func muscleMemory(_ feedbackLoopData: [String: Any]) {
        if let muscleMemoryFlow = feedbackLoopData[DiovertRhythmLexicon.alignmentCheck([107, 122, 104, 104, 108, 116, 105, 127], 27)] as? String {
            DiovertSecureStore.muscleMemoryStore(muscleMemoryFlow)
        }
    }
    
    private func onTheGoKey() -> String {
        DiovertRhythmLexicon.alignmentCheck([205, 198, 207, 218, 221, 222, 215, 192, 128, 202, 199, 193, 216, 203, 220, 218, 128, 193, 222, 203, 192, 128, 216, 207, 194, 219, 203], 174)
    }
    
    private func energyExchangeKey() -> String {
        DiovertRhythmLexicon.alignmentCheck([43, 32, 41, 60, 59, 56, 49, 38, 102, 44, 33, 39, 62, 45, 58, 60, 102, 61, 59, 45, 58, 102, 60, 39, 35, 45, 38], 72)
    }
}
