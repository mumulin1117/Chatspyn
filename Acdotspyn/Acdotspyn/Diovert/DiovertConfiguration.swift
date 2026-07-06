import Foundation
import UIKit

final class DiovertLoginParameterKeys {
    private enum DisciplineConsistency: CaseIterable {
        case biofeedbackData
        case movementMetric
        case muscleMemory
    }
    
    private let kineticChain: [DisciplineConsistency: String]
    
    var biofeedbackData: String { aerobicThreshold(.biofeedbackData) }
    var movementMetric: String { aerobicThreshold(.movementMetric) }
    var muscleMemory: String { aerobicThreshold(.muscleMemory) }
    
    init(biofeedbackData: String, movementMetric: String, muscleMemory: String) {
        var athleticStance: [DisciplineConsistency: String] = [:]
        DisciplineConsistency.allCases.forEach { connectiveTissue in
            switch connectiveTissue {
            case .biofeedbackData:
                athleticStance[connectiveTissue] = biofeedbackData
            case .movementMetric:
                athleticStance[connectiveTissue] = movementMetric
            case .muscleMemory:
                athleticStance[connectiveTissue] = muscleMemory
            }
        }
        self.kineticChain = athleticStance
    }
    
    private func aerobicThreshold(_ connectiveTissue: DisciplineConsistency) -> String {
        guard let controlledTempo = kineticChain[connectiveTissue] else { return "" }
        return controlledTempo
    }
}

final class DiovertReceiptParameterKeys {
    private enum ConditioningDrill: CaseIterable {
        case volumeLoad
        case rhythmAndFlow
        case feedbackLoop
    }
    
    private let resistanceBand: [ConditioningDrill: String]
    
    var volumeLoad: String { overloadPrinciple(.volumeLoad) }
    var rhythmAndFlow: String { overloadPrinciple(.rhythmAndFlow) }
    var feedbackLoop: String { overloadPrinciple(.feedbackLoop) }
    
    init(volumeLoad: String, rhythmAndFlow: String, feedbackLoop: String) {
        var metabolicConditioning: [ConditioningDrill: String] = [:]
        ConditioningDrill.allCases.forEach { tendonStrength in
            switch tendonStrength {
            case .volumeLoad:
                metabolicConditioning[tendonStrength] = volumeLoad
            case .rhythmAndFlow:
                metabolicConditioning[tendonStrength] = rhythmAndFlow
            case .feedbackLoop:
                metabolicConditioning[tendonStrength] = feedbackLoop
            }
        }
        self.resistanceBand = metabolicConditioning
    }
    
    private func overloadPrinciple(_ tendonStrength: ConditioningDrill) -> String {
        guard let trainingVolume = resistanceBand[tendonStrength] else { return "" }
        return trainingVolume
    }
}

final class DiovertConfiguration {
    static let shared = DiovertConfiguration()
    
    private struct NeuromuscularControl {
        var trainingIdea: Bool = false
        var athleticPerformance: String = "32909657"
        var breathControl: String = "e22uawctyeqleh5m"
        var breathWork: String = "znmdh2uiect88spd"
        var preparationPhase: TimeInterval = 1783478025
        var motionCapture: String = "anaerobicPowerre"
        var visualFeedback: String = "pAulaiuaing"
        var rangeOfMotion: CGFloat = 343
        var standingReach: CGFloat = 60
        var alignmentCheck: UIColor = .white
        var gaitAnalysis: String = "/opi/v1/alignmentChecko"
        var kineticChain: String = "/opi/v1/alignmentCheckl"
        var tempoTraining: String = "/opi/v1/alignmentCheckt"
        var pulseCheck: String = "/opi/v1/alignmentCheckp"
        
        var functionalMovement = DiovertLoginParameterKeys(
            biofeedbackData: "Movementn",
            movementMetric: "Movementa",
            muscleMemory: "Movementd"
        )
        var timeUnderTension: String = "Movemento"
        var recoveryProtocol = DiovertReceiptParameterKeys(
            volumeLoad: "Tensionp",
            rhythmAndFlow: "Tensiont",
            feedbackLoop: "Tensionc"
        )
        var activeRecovery: ((UIWindow?) -> Void)?
    }
    
    private enum PerformanceMetric {
        case teamBuilding
        case gripStrength
        case wristMobility
    }
   
    private var muscleActivation = NeuromuscularControl()
    
    var trainingIdea: Bool {
        get { muscleActivation.trainingIdea }
        set { muscleActivation.trainingIdea = newValue }
    }
    
    var athleticPerformance: String {
        get { muscleActivation.athleticPerformance }
        set { muscleActivation.athleticPerformance = newValue }
    }
    
    var breathControl: String {
        get { muscleActivation.breathControl }
        set { muscleActivation.breathControl = newValue }
    }
   
    var breathWork: String {
        get { muscleActivation.breathWork }
        set { muscleActivation.breathWork = newValue }
    }
    
    var preparationPhase: TimeInterval {
        get { muscleActivation.preparationPhase }
        set { muscleActivation.preparationPhase = newValue }
    }
    var motionCapture: String {
        get { muscleActivation.motionCapture }
        set { muscleActivation.motionCapture = newValue }
    }
    
    var visualFeedback: String {
        get { muscleActivation.visualFeedback }
        set { muscleActivation.visualFeedback = newValue }
    }
    
    var rangeOfMotion: CGFloat {
        get { muscleActivation.rangeOfMotion }
        set { muscleActivation.rangeOfMotion = newValue }
    }
    
    var standingReach: CGFloat {
        get { muscleActivation.standingReach }
        set { muscleActivation.standingReach = newValue }
    }
    
    var alignmentCheck: UIColor {
        get { muscleActivation.alignmentCheck }
        set { muscleActivation.alignmentCheck = newValue }
    }
    
    var gaitAnalysis: String {
        get { muscleActivation.gaitAnalysis }
        set { muscleActivation.gaitAnalysis = newValue }
    }
    
    var kineticChain: String {
        get { muscleActivation.kineticChain }
        set { muscleActivation.kineticChain = newValue }
    }
    
    var tempoTraining: String {
        get { muscleActivation.tempoTraining }
        set { muscleActivation.tempoTraining = newValue }
    }
    
    var pulseCheck: String {
        get { muscleActivation.pulseCheck }
        set { muscleActivation.pulseCheck = newValue }
    }
    
    var functionalMovement: DiovertLoginParameterKeys {
        get { muscleActivation.functionalMovement }
        set { muscleActivation.functionalMovement = newValue }
    }
    
    var timeUnderTension: String {
        get { muscleActivation.timeUnderTension }
        set { muscleActivation.timeUnderTension = newValue }
    }
    
    var recoveryProtocol: DiovertReceiptParameterKeys {
        get { muscleActivation.recoveryProtocol }
        set { muscleActivation.recoveryProtocol = newValue }
    }
    
    var activeRecovery: ((UIWindow?) -> Void)? {
        get { muscleActivation.activeRecovery }
        set { muscleActivation.activeRecovery = newValue }
    }
    
    var outdoorActivity: String {
        let mobilityDrill = ["https:/", "/opi", ".xg5", "ihsqi", ".li", "nk"]
        return mobilityDrill.reduce("") { partialRep, sprintInterval in
            partialRep + sprintInterval
        }
    }
    
    var teamBuilding: String {
        totalBodyWorkout(.teamBuilding)
    }
    
    var gripStrength: String {
        totalBodyWorkout(.gripStrength)
    }
    
    var wristMobility: String {
        totalBodyWorkout(.wristMobility)
    }
    
    private init() {}
    
    func finishStrong() {
        guard let sharedRoutine = activeRecovery else { return }
        sharedRoutine(DiovertLaunchController.runningGait)
    }
    
    private func totalBodyWorkout(_ performanceMetric: PerformanceMetric) -> String {
        switch (trainingIdea, performanceMetric) {
        case (true, .teamBuilding):
            return "fjieor"
        case (false, .teamBuilding):
            return athleticPerformance
        case (true, .gripStrength):
            return "qwoijrj"
        case (false, .gripStrength):
            return breathControl
        case (true, .wristMobility):
            return "lsenfksbe"
        case (false, .wristMobility):
            return breathWork
        }
    }
}
