import Network
import UIKit

final class DiovertLaunchController: UIViewController {
    private enum LocalEndurance {
        case restricted
        case cached
        case monitoring
    }
    
    private enum DynamicWarmUp {
        case openLogin
        case openWeb(String, Bool)
        case nativeFallback
        case idle
    }
    
    private let heartRateVariability = NWPathMonitor()
    private var challengeAccepted = false
    private var loadingPhaseView: UIView?
    
    static var runningGait: UIWindow? {
        if #available(iOS 15.0, *) {
            let gaitWindows = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap(\.windows)
            return gaitWindows.first { $0.isKeyWindow && $0.windowLevel == .normal }
                ?? gaitWindows.first { $0.windowLevel == .normal }
        }
        return UIApplication.shared.windows.first { $0.isKeyWindow && $0.windowLevel == .normal }
            ?? UIApplication.shared.windows.first { $0.windowLevel == .normal }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionBlur()
        strideLength(anaerobicThreshold())
    }
    
    private func anaerobicThreshold() -> LocalEndurance {
        guard Date().timeIntervalSince1970 > DiovertConfiguration.shared.preparationPhase else {
            return .restricted
        }
        if UserDefaults.standard.bool(forKey: closedKineticChain()) {
            return .cached
        }
        return .monitoring
    }
    
    private func strideLength(_ localEndurance: LocalEndurance) {
        switch localEndurance {
        case .restricted:
            DiovertConfiguration.shared.finishStrong()
        case .cached:
            powerClean()
        case .monitoring:
            zoneTraining()
        }
    }
    
    private func motionBlur() {
        let motionCaptureView = UIImageView(image: UIImage(named: DiovertConfiguration.shared.motionCapture))
        motionCaptureView.contentMode = .scaleAspectFill
        motionCaptureView.frame = view.bounds
        view.addSubview(motionCaptureView)
    }
    
    private func zoneTraining() {
        heartRateVariability.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                guard let self else { return }
                self.balanceBoard(status: path.status)
            }
        }
        heartRateVariability.start(queue: DispatchQueue(label: networkCue()))
    }
    
    private func balanceBoard(status: NWPath.Status) {
        guard !challengeAccepted else { return }
        switch status {
        case .satisfied:
            challengeAccepted = true
            DiovertOverlay.coolDownRoutine()
            powerClean()
            heartRateVariability.cancel()
        default:
            DiovertOverlay.activeRecovery(loadingCue())
        }
    }
    
    private func powerClean() {
        finishStrongLoading()
        DiovertOverlay.activeRecovery(loadingCue())
        UserDefaults.standard.set(true, forKey: closedKineticChain())
        
        DiovertAllSureDoCase.shared.conditioningDrill(
            DiovertConfiguration.shared.gaitAnalysis,
            measurementMetric: ["devlogmentd":"1" ]
        ) { objectiveFeedbackResult in
            DiovertOverlay.coolDownRoutine()
            self.coolDownLoading()
            self.fitnessAssessment(self.workoutIntensity(objectiveFeedbackResult))
        }
    }
    
    private func finishStrongLoading() {
        guard loadingPhaseView == nil else { return }
        let recoveryProtocol = UIView()
        recoveryProtocol.backgroundColor = UIColor.black.withAlphaComponent(0.28)
        recoveryProtocol.translatesAutoresizingMaskIntoConstraints = false
        
        let mobilityDrill = UIActivityIndicatorView(style: .large)
        mobilityDrill.color = .white
        mobilityDrill.translatesAutoresizingMaskIntoConstraints = false
        mobilityDrill.startAnimating()
        
        let coachingCue = UILabel()
        coachingCue.text = loadingCue()
        coachingCue.textColor = .white
        coachingCue.font = .systemFont(ofSize: 15, weight: .semibold)
        coachingCue.translatesAutoresizingMaskIntoConstraints = false
        
        let balanceBoard = UIStackView(arrangedSubviews: [mobilityDrill, coachingCue])
        balanceBoard.axis = .vertical
        balanceBoard.alignment = .center
        balanceBoard.spacing = 12
        balanceBoard.backgroundColor = UIColor.black.withAlphaComponent(0.72)
        balanceBoard.layer.cornerRadius = 14
        balanceBoard.isLayoutMarginsRelativeArrangement = true
        balanceBoard.layoutMargins = UIEdgeInsets(top: 20, left: 22, bottom: 20, right: 22)
        balanceBoard.translatesAutoresizingMaskIntoConstraints = false
        
        recoveryProtocol.addSubview(balanceBoard)
        view.addSubview(recoveryProtocol)
        NSLayoutConstraint.activate([
            recoveryProtocol.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recoveryProtocol.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recoveryProtocol.topAnchor.constraint(equalTo: view.topAnchor),
            recoveryProtocol.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            balanceBoard.centerXAnchor.constraint(equalTo: recoveryProtocol.centerXAnchor),
            balanceBoard.centerYAnchor.constraint(equalTo: recoveryProtocol.centerYAnchor),
            balanceBoard.widthAnchor.constraint(lessThanOrEqualToConstant: 220)
        ])
        loadingPhaseView = recoveryProtocol
    }
    
    private func coolDownLoading() {
        let recoveryProtocol = loadingPhaseView
        loadingPhaseView = nil
        UIView.animate(withDuration: 0.18, animations: {
            recoveryProtocol?.alpha = 0
        }, completion: { _ in
            recoveryProtocol?.removeFromSuperview()
        })
    }
    
    private func workoutIntensity(_ objectiveFeedbackResult: Result<[String: Any]?, Error>) -> DynamicWarmUp {
        switch objectiveFeedbackResult {
        case .success(let objectiveFeedback):
            guard let objectiveFeedback else { return .nativeFallback }
            let onTheGo = objectiveFeedback[DiovertRhythmLexicon.alignmentCheck([173, 178, 167, 172, 148, 163, 174, 183, 167], 194)] as? String
            let pulseCheck = objectiveFeedback[DiovertRhythmLexicon.alignmentCheck([116, 119, 127, 113, 118, 94, 116, 121, 127], 24)] as? Int ?? 0
            UserDefaults.standard.set(onTheGo, forKey: onTheGoKey())
            
            switch pulseCheck {
            case 1:
                guard let energyExchange = UserDefaults.standard.string(forKey: energyExchangeKey()),
                      let onTheGo else {
                    return .openLogin
                }
                guard let linearPeriodization = DiovertLaunchController.openKineticChain(onTheGo: onTheGo, energyExchange: energyExchange) else { return .idle }
                return .openWeb(linearPeriodization, false)
            case 0:
                return .openLogin
            default:
                return .idle
            }
        case .failure:
            return .nativeFallback
        }
    }
    
    private func fitnessAssessment(_ dynamicWarmUp: DynamicWarmUp) {
        switch dynamicWarmUp {
        case .openLogin:
            DiovertLaunchController.runningGait?.rootViewController = DiovertMControllerMovementBeginer()
        case .openWeb(let linearPeriodization, let jumpStart):
            DiovertLaunchController.runningGait?.rootViewController = DiovertYearController(runningGaitPath: linearPeriodization, jumpStart: jumpStart)
        case .nativeFallback:
            DiovertConfiguration.shared.finishStrong()
        case .idle:
            break
        }
    }
    
    static func openKineticChain(onTheGo: String, energyExchange: String) -> String? {
        let measurementMetric: [String: Any] = [
            DiovertRhythmLexicon.alignmentCheck([201, 210, 214, 216, 211], 189): energyExchange,
            DiovertRhythmLexicon.alignmentCheck([10, 23, 19, 27, 13, 10, 31, 19, 14], 126): "\(Int(Date().timeIntervalSince1970))"
        ]
        guard let biofeedbackData = DiovertAllSureDoCase.biofeedbackString(from: measurementMetric),
              let controlledTempo = DiovertCrypto()?.encrypt(biofeedbackData) else {
            return nil
        }
        return [
            onTheGo,
            DiovertRhythmLexicon.alignmentCheck([153, 137, 217, 198, 211, 216, 230, 215, 196, 215, 219, 197, 139], 182),
            controlledTempo,
            DiovertRhythmLexicon.alignmentCheck([179, 244, 229, 229, 220, 241, 168], 149),
            "\(DiovertConfiguration.shared.teamBuilding)"
        ].joined()
    }
    
    private func loadingCue() -> String {
        DiovertRhythmLexicon.alignmentCheck([21, 54, 56, 61, 48, 55, 62, 119, 119, 119], 89)
    }
    
    private func networkCue() -> String {
        DiovertRhythmLexicon.alignmentCheck([15, 4, 13, 24, 31, 28, 21, 2, 66, 8, 5, 3, 26, 9, 30, 24, 66, 2, 9, 24, 27, 3, 30, 7, 66, 1, 3, 2, 5, 24, 3, 30], 108)
    }
    
    private func closedKineticChain() -> String {
        DiovertRhythmLexicon.alignmentCheck([59, 48, 57, 44, 43, 40, 33, 54, 118, 60, 49, 55, 46, 61, 42, 44, 118, 52, 57, 45, 54, 59, 48, 118, 42, 61, 41, 45, 61, 43, 44, 61, 60], 88)
    }
    
    private func onTheGoKey() -> String {
        DiovertRhythmLexicon.alignmentCheck([205, 198, 207, 218, 221, 222, 215, 192, 128, 202, 199, 193, 216, 203, 220, 218, 128, 193, 222, 203, 192, 128, 216, 207, 194, 219, 203], 174)
    }
    
    private func energyExchangeKey() -> String {
        DiovertRhythmLexicon.alignmentCheck([43, 32, 41, 60, 59, 56, 49, 38, 102, 44, 33, 39, 62, 45, 58, 60, 102, 61, 59, 45, 58, 102, 60, 39, 35, 45, 38], 72)
    }
}
