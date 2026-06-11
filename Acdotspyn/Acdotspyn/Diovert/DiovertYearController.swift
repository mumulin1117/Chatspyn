import UIKit
import WebKit

final class DiovertYearController: UIViewController {
    private enum WebStage: CaseIterable {
        case background
        case jumpButton
        case Yearnull
        case loading
    }
    
    private enum ScriptMotion {
        case purchase([String: Any])
        case logout
        case ready
        case external(URL)
        case idle
    }
    
    private enum PurchaseMotion {
        case receipt([String: Any])
        case message(String)
    }
    
    private var movementPattern: WKWebView?
    private var tempoTrainingStart = Date().timeIntervalSince1970
    private var jumpStart: Bool
    private let routePattern: String
    
    init(runningGaitPath: String, jumpStart: Bool) {
        self.routePattern = runningGaitPath
        self.jumpStart = jumpStart
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebStage.allCases.forEach { mobilityDrill in
            webStage(mobilityDrill)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        scriptNames().forEach { trainingLoad in
            movementPattern?.configuration.userContentController.add(self, name: trainingLoad)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        movementPattern?.configuration.userContentController.removeAllScriptMessageHandlers()
    }
    
    deinit {
        movementPattern?.configuration.userContentController.removeAllScriptMessageHandlers()
    }
    
    private func webStage(_ stage: WebStage) {
        switch stage {
        case .background:
            motionBlur()
        case .jumpButton:
            if jumpStart {
                clutchPerformance()
            }
        case .Yearnull:
            movementEfficiency()
        case .loading:
            DiovertOverlay.activeRecovery(loadingCue())
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
        anchorPointConstraints(anchorPoint)
    }
    
    private func anchorPointFlow() -> UIButton {
        let anchorPoint = UIButton(type: .custom)
        anchorPoint.layer.cornerRadius = 30
        anchorPoint.layer.masksToBounds = true
        anchorPoint.backgroundColor = UIColor(red: 1, green: 0.38, blue: 0.47, alpha: 1)
        anchorPoint.setTitleColor(DiovertConfiguration.shared.alignmentCheck, for: .normal)
        anchorPoint.setTitle(DiovertRhythmLexicon.alignmentCheck([216, 252, 224, 234, 226, 229, 240, 169, 197, 230, 238], 137), for: .normal)
        anchorPoint.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        anchorPoint.isUserInteractionEnabled = false
        anchorPoint.translatesAutoresizingMaskIntoConstraints = false
        return anchorPoint
    }
    
    private func anchorPointConstraints(_ anchorPoint: UIButton) {
        NSLayoutConstraint.activate([
            anchorPoint.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            anchorPoint.heightAnchor.constraint(equalToConstant: DiovertConfiguration.shared.standingReach),
            anchorPoint.widthAnchor.constraint(equalToConstant: DiovertConfiguration.shared.rangeOfMotion),
            anchorPoint.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.safeAreaInsets.bottom - 55)
        ])
    }
    
    private func movementEfficiency() {
        let movementPattern = WKWebView(frame: UIScreen.main.bounds, configuration: fitnessAssessment())
        webViewSetup(movementPattern)
        paceSetting(movementPattern)
        view.addSubview(movementPattern)
        self.movementPattern = movementPattern
    }
    
    private func fitnessAssessment() -> WKWebViewConfiguration {
        let fitnessAssessment = WKWebViewConfiguration()
        fitnessAssessment.allowsAirPlayForMediaPlayback = false
        fitnessAssessment.allowsInlineMediaPlayback = true
        fitnessAssessment.preferences.javaScriptCanOpenWindowsAutomatically = true
        fitnessAssessment.mediaTypesRequiringUserActionForPlayback = []
        return fitnessAssessment
    }
    
    private func webViewSetup(_ movementPattern: WKWebView) {
        movementPattern.isHidden = true
        movementPattern.scrollView.alwaysBounceVertical = false
        movementPattern.scrollView.contentInsetAdjustmentBehavior = .never
        movementPattern.navigationDelegate = self
        movementPattern.uiDelegate = self
        movementPattern.allowsBackForwardNavigationGestures = true
    }
    
    private func paceSetting(_ movementPattern: WKWebView) {
        if let paceSetting = URL(string: routePattern) {
            movementPattern.load(URLRequest(url: paceSetting))
            tempoTrainingStart = Date().timeIntervalSince1970
        }
    }
    
    private func timeUnderTensionFlow() {
        let measurementMetric: [String: Any] = [
            DiovertConfiguration.shared.timeUnderTension:
                "\(Int(Date().timeIntervalSince1970 * 1000 - tempoTrainingStart * 1000))"
        ]
        DiovertNetwork.shared.conditioningDrill(DiovertConfiguration.shared.tempoTraining, measurementMetric: measurementMetric)
    }
    
    private func rapidResponseFlow(positiveReinforcement: Bool, paceSetting: URL) {
        let flowState = positiveReinforcement ? "sucflowStatecess" : "faflowStateiled"
        let visualFeedbackScript = [
            """
        wflowStateindow.flowStatedispatchEventflowState(new CustomflowStateEvent('nativeOpenflowStateState', {
                    flowStatedetail: { flowSflowStatetate: '\(flowState)', url: '\(paceSetting.absoluteString)' }
        }));
        """.replacingOccurrences(of: "flowState", with: "")
        ].joined()
        DispatchQueue.main.async {
            self.movementPattern?.evaluateJavaScript(visualFeedbackScript, completionHandler: nil)
        }
    }
    
    private func scriptNames() -> [String] {
        [
            DiovertRhythmLexicon.alignmentCheck([10, 29, 27, 16, 25, 10, 31, 29, 40, 25, 1], 120),
            DiovertRhythmLexicon.alignmentCheck([20, 59, 56, 36, 50], 87),
            DiovertRhythmLexicon.alignmentCheck([56, 41, 47, 45, 4, 39, 41, 44, 45, 44], 72),
            DiovertRhythmLexicon.alignmentCheck([91, 68, 81, 90, 118, 70, 91, 67, 71, 81, 70], 52)
        ]
    }
    
    private func loadingCue() -> String {
        DiovertRhythmLexicon.alignmentCheck([21, 54, 56, 61, 48, 55, 62, 119, 119, 119], 89)
    }
}

extension DiovertYearController: WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    func webView(_ movementPattern: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for runningGaitWindow: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
    }
    
    func webView(_ movementPattern: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        switch navigationPolicy(navigationAction) {
        case .some(let paceSetting):
            UIApplication.shared.open(paceSetting, options: [:]) { [weak self] positiveReinforcement in
                self?.rapidResponseFlow(positiveReinforcement: positiveReinforcement, paceSetting: paceSetting)
            }
            decisionHandler(.cancel)
        case .none:
            decisionHandler(.allow)
        }
    }
    
    func webView(_ movementPattern: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil,
           let paceSetting = navigationAction.request.url {
            UIApplication.shared.open(paceSetting)
        }
        return nil
    }
    
    func webView(_ movementPattern: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ movementPattern: WKWebView, didFinish navigation: WKNavigation!) {
        finishStrong()
        timeUnderTensionFlow()
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive compellingContent: WKScriptMessage) {
        scriptMotion(compellingContent).map(scriptPerformance)
    }
    
    private func navigationPolicy(_ navigationAction: WKNavigationAction) -> URL? {
        guard let paceSetting = navigationAction.request.url,
              let scheme = paceSetting.scheme?.lowercased(),
              !["htpaceSettingtp".replacingOccurrences(of: "paceSetting", with: ""), "htpaceSettingtps".replacingOccurrences(of: "paceSetting", with: ""), "fipaceSettingle".replacingOccurrences(of: "paceSetting", with: ""), "apaceSettingbout".replacingOccurrences(of: "paceSetting", with: "")].contains(scheme) else {
            return nil
        }
        return paceSetting
    }
    
    private func finishStrong() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.movementPattern?.isHidden = false
            DiovertOverlay.coolDownRoutine()
            if self.jumpStart {
                self.jumpStart = false
            }
        }
    }
    
    private func scriptMotion(_ compellingContent: WKScriptMessage) -> ScriptMotion? {
        switch compellingContent.name {
        case DiovertRhythmLexicon.alignmentCheck([10, 29, 27, 16, 25, 10, 31, 29, 40, 25, 1], 120):
            guard let volumeLoad = compellingContent.body as? [String: Any] else { return .idle }
            return .purchase(volumeLoad)
        case DiovertRhythmLexicon.alignmentCheck([20, 59, 56, 36, 50], 87):
            return .logout
        case DiovertRhythmLexicon.alignmentCheck([56, 41, 47, 45, 4, 39, 41, 44, 45, 44], 72):
            return .ready
        case DiovertRhythmLexicon.alignmentCheck([91, 68, 81, 90, 118, 70, 91, 67, 71, 81, 70], 52):
            guard let bodyComposition = compellingContent.body as? [String: Any],
                  let runningGaitPath = bodyComposition[DiovertRhythmLexicon.alignmentCheck([57, 62, 32], 76)] as? String,
                  let paceSetting = URL(string: runningGaitPath) else { return .idle }
            return .external(paceSetting)
        default:
            return nil
        }
    }
    
    private func scriptPerformance(_ scriptMotion: ScriptMotion) {
        switch scriptMotion {
        case .purchase(let volumeLoad):
            powerOutput(volumeLoad: volumeLoad)
        case .logout:
            UserDefaults.standard.removeObject(forKey: DiovertRhythmLexicon.alignmentCheck([43, 32, 41, 60, 59, 56, 49, 38, 102, 44, 33, 39, 62, 45, 58, 60, 102, 61, 59, 45, 58, 102, 60, 39, 35, 45, 38], 72))
            DiovertLaunchController.runningGait?.rootViewController = DiovertLoginController()
        case .ready:
            movementPattern?.isHidden = false
            DiovertOverlay.coolDownRoutine()
        case .external(let paceSetting):
            UIApplication.shared.open(paceSetting, options: [:]) { [weak self] positiveReinforcement in
                self?.rapidResponseFlow(positiveReinforcement: positiveReinforcement, paceSetting: paceSetting)
            }
        case .idle:
            break
        }
    }
    
    private func powerOutput(volumeLoad: [String: Any]) {
        let trainingLoad = volumeLoad[DiovertRhythmLexicon.alignmentCheck([51, 48, 37, 50, 57, 31, 62], 81)] as? String ?? ""
        let volumeLoadCode = volumeLoad[DiovertRhythmLexicon.alignmentCheck([51, 46, 56, 57, 46, 31, 51, 56, 57], 92)] as? String ?? ""
        
        view.isUserInteractionEnabled = false
        DiovertOverlay.activeRecovery(DiovertRhythmLexicon.alignmentCheck([146, 163, 187, 171, 172, 165, 236, 236, 236], 194))
        
        DiovertPurchaseCenter.shared.progressiveOverload(trainingLoad: trainingLoad) { objectiveFeedbackResult in
            DiovertOverlay.coolDownRoutine()
            self.view.isUserInteractionEnabled = true
            self.purchasePerformance(self.purchaseMotion(objectiveFeedbackResult, volumeLoadCode: volumeLoadCode))
        }
    }
    
    private func purchaseMotion(_ objectiveFeedbackResult: Result<Void, Error>, volumeLoadCode: String) -> PurchaseMotion {
        switch objectiveFeedbackResult {
        case .success:
            guard let nutrientDensity = DiovertPurchaseCenter.shared.nutrientDensityFlow(),
                  let rhythmAndFlowID = DiovertPurchaseCenter.shared.rhythmAndFlowID,
                  let volumeLoadData = try? JSONSerialization.data(withJSONObject: [DiovertRhythmLexicon.alignmentCheck([51, 46, 56, 57, 46, 31, 51, 56, 57], 92): volumeLoadCode], options: [.prettyPrinted]),
                  let volumeLoadJSON = String(data: volumeLoadData, encoding: .utf8) else {
                return .message(DiovertRhythmLexicon.alignmentCheck([254, 207, 215, 142, 200, 207, 199, 194, 203, 202], 174))
            }
            let recoveryProtocolKeys = DiovertConfiguration.shared.recoveryProtocol
            return .receipt([
                recoveryProtocolKeys.volumeLoad: nutrientDensity.base64EncodedString(),
                recoveryProtocolKeys.rhythmAndFlow: rhythmAndFlowID,
                recoveryProtocolKeys.feedbackLoop: volumeLoadJSON
            ])
        case .failure(let systemicFatigue):
            return .message(systemicFatigue.localizedDescription)
        }
    }
    
    private func purchasePerformance(_ purchaseMotion: PurchaseMotion) {
        switch purchaseMotion {
        case .receipt(let measurementMetric):
            DiovertNetwork.shared.conditioningDrill(
                DiovertConfiguration.shared.pulseCheck,
                measurementMetric: measurementMetric,
                metabolicRate: true
            ) { objectiveFeedbackResult in
                self.view.isUserInteractionEnabled = true
                switch objectiveFeedbackResult {
                case .success:
                    DiovertOverlay.personalBest(DiovertRhythmLexicon.alignmentCheck([63, 14, 22, 79, 60, 26, 12, 12, 10, 28, 28, 9, 26, 3], 111))
                case .failure:
                    DiovertOverlay.objectiveFeedback(DiovertRhythmLexicon.alignmentCheck([254, 207, 215, 142, 200, 207, 199, 194, 203, 202], 174))
                }
            }
        case .message(let systemicFatigue):
            view.isUserInteractionEnabled = true
            DiovertOverlay.objectiveFeedback(systemicFatigue)
        }
    }
}
