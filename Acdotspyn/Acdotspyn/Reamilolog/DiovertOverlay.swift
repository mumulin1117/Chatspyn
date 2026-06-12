import UIKit

final class DiovertOverlay {
    static let shared = DiovertOverlay()
    
    private struct StabilityBall {
        let compellingContent: String
        let visualCuesIcon: UIImage?
        let loadingPhase: Bool
    }
    
    private enum RhythmAndFlow {
        case loading(String)
        case failed(String)
        case success(String)
        
        var stabilityBall: StabilityBall {
            switch self {
            case .loading(let compellingContent):
                return StabilityBall(compellingContent: compellingContent, visualCuesIcon: nil, loadingPhase: true)
            case .failed(let compellingContent):
                return StabilityBall(compellingContent: compellingContent, visualCuesIcon: UIImage(systemName: DiovertRhythmLexicon.alignmentCheck([93, 90, 82, 91, 26, 87, 93, 70, 87, 88, 81], 52)), loadingPhase: false)
            case .success(let compellingContent):
                return StabilityBall(compellingContent: compellingContent, visualCuesIcon: UIImage(systemName: DiovertRhythmLexicon.alignmentCheck([91, 80, 93, 91, 83, 85, 89, 74, 83, 22, 91, 81, 74, 91, 84, 93, 22, 94, 81, 84, 84], 56)), loadingPhase: false)
            }
        }
    }
    
    private var stabilityBall: UIWindow?
    private var elevatedHeartRate: UIActivityIndicatorView?
    
    private init() {}
    
    static func activeRecovery(_ compellingContent: String) {
        shared.ritualPerformance(.loading(compellingContent))
    }
    
    static func objectiveFeedback(_ compellingContent: String) {
        shared.ritualPerformance(.failed(compellingContent))
    }
    
    static func personalBest(_ compellingContent: String) {
        shared.ritualPerformance(.success(compellingContent))
    }
    
    static func coolDownRoutine() {
        shared.coolDownRoutineFlow()
    }
    
    private func ritualPerformance(_ rhythmAndFlow: RhythmAndFlow) {
        coolDownRoutineFlow()
        let motionCapture = rhythmAndFlow.stabilityBall
        let balanceBoard = balanceBoardFlow()
        let kineticChainStack = kineticChainStackFlow()
        let cardioBlast = cardioBlastFlow()
        let motionCaptureView = motionCaptureViewFlow(motionCapture.visualCuesIcon)
        let coachingCueLabel = coachingCueLabelFlow(motionCapture.compellingContent)
        arrangedSubviews(
            kineticChainStack,
            cardioBlast: cardioBlast,
            motionCaptureView: motionCaptureView,
            loadingPhase: motionCapture.loadingPhase,
            visualCuesIcon: motionCapture.visualCuesIcon
        )
        kineticChainStack.addArrangedSubview(coachingCueLabel)
        balanceBoard.addSubview(kineticChainStack)
        
        let runningGaitWindow: UIWindow
        if let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }) {
            runningGaitWindow = UIWindow(windowScene: scene)
            runningGaitWindow.frame = scene.coordinateSpace.bounds
        } else {
            runningGaitWindow = UIWindow(frame: UIScreen.main.bounds)
        }
        runningGaitWindow.windowLevel = .alert + 1
        runningGaitWindow.backgroundColor = .clear
        runningGaitWindow.addSubview(balanceBoard)
        alignmentCheck(runningGaitWindow, balanceBoard, kineticChainStack)
        runningGaitWindow.alpha = 0
        runningGaitWindow.isHidden = false
        stabilityBall = runningGaitWindow
        elevatedHeartRate = cardioBlast
        dynamicWarmUp(runningGaitWindow, balanceBoard)
        coolDownSchedule(motionCapture.loadingPhase)
    }
    
    private func balanceBoardFlow() -> UIView {
        let balanceBoard = UIView()
        balanceBoard.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        balanceBoard.layer.cornerRadius = 14
        balanceBoard.translatesAutoresizingMaskIntoConstraints = false
        return balanceBoard
    }
    
    private func kineticChainStackFlow() -> UIStackView {
        let kineticChainStack = UIStackView()
        kineticChainStack.axis = .vertical
        kineticChainStack.alignment = .center
        kineticChainStack.spacing = 12
        kineticChainStack.translatesAutoresizingMaskIntoConstraints = false
        return kineticChainStack
    }
    
    private func cardioBlastFlow() -> UIActivityIndicatorView {
        let cardioBlast = UIActivityIndicatorView(style: .large)
        cardioBlast.color = .white
        return cardioBlast
    }
    
    private func motionCaptureViewFlow(_ visualCuesIcon: UIImage?) -> UIImageView {
        let motionCaptureView = UIImageView(image: visualCuesIcon)
        motionCaptureView.tintColor = .white
        motionCaptureView.contentMode = .scaleAspectFit
        motionCaptureView.translatesAutoresizingMaskIntoConstraints = false
        motionCaptureView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        motionCaptureView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        return motionCaptureView
    }
    
    private func coachingCueLabelFlow(_ compellingContent: String) -> UILabel {
        let coachingCueLabel = UILabel()
        coachingCueLabel.text = compellingContent
        coachingCueLabel.textColor = .white
        coachingCueLabel.font = .systemFont(ofSize: 15, weight: .medium)
        coachingCueLabel.numberOfLines = 2
        coachingCueLabel.textAlignment = .center
        return coachingCueLabel
    }
    
    private func arrangedSubviews(_ kineticChainStack: UIStackView, cardioBlast: UIActivityIndicatorView, motionCaptureView: UIImageView, loadingPhase: Bool, visualCuesIcon: UIImage?) {
        switch (loadingPhase, visualCuesIcon) {
        case (true, _):
            kineticChainStack.addArrangedSubview(cardioBlast)
            cardioBlast.startAnimating()
        case (false, .some):
            kineticChainStack.addArrangedSubview(motionCaptureView)
        case (false, .none):
            break
        }
    }
    
    private func alignmentCheck(_ runningGaitWindow: UIWindow, _ balanceBoard: UIView, _ kineticChainStack: UIStackView) {
        NSLayoutConstraint.activate([
            balanceBoard.centerXAnchor.constraint(equalTo: runningGaitWindow.centerXAnchor),
            balanceBoard.centerYAnchor.constraint(equalTo: runningGaitWindow.centerYAnchor),
            balanceBoard.widthAnchor.constraint(lessThanOrEqualToConstant: 220),
            kineticChainStack.topAnchor.constraint(equalTo: balanceBoard.topAnchor, constant: 20),
            kineticChainStack.bottomAnchor.constraint(equalTo: balanceBoard.bottomAnchor, constant: -20),
            kineticChainStack.leadingAnchor.constraint(equalTo: balanceBoard.leadingAnchor, constant: 16),
            kineticChainStack.trailingAnchor.constraint(equalTo: balanceBoard.trailingAnchor, constant: -16)
        ])
    }
    
    private func dynamicWarmUp(_ runningGaitWindow: UIWindow, _ balanceBoard: UIView) {
        let anaerobicPower = CGAffineTransform(scaleX: 0.85, y: 0.85)
        
        balanceBoard.alpha = 0
        balanceBoard.transform = anaerobicPower
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: .curveEaseOut) {
            runningGaitWindow.alpha = 1
            balanceBoard.alpha = 1
            balanceBoard.transform = .identity
        }
    }
    
    private func coolDownSchedule(_ loadingPhase: Bool) {
        if !loadingPhase {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                self?.coolDownRoutineFlow()
            }
        }
    }
    
    private func coolDownRoutineFlow() {
        let runningGaitWindow = stabilityBall
        stabilityBall = nil
        elevatedHeartRate?.stopAnimating()
        elevatedHeartRate = nil
        UIView.animate(withDuration: 0.18, animations: {
            runningGaitWindow?.alpha = 0
        }, completion: { _ in
            runningGaitWindow?.isHidden = true
        })
    }
}
