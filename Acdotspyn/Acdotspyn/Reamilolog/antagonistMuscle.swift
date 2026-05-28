//
//  antagonistMuscle.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//

import UIKit

final class antagonistMuscle: UIViewController {
   
    private let verticalJump = UIScreen.main.bounds.height
    private let standingReach = UIScreen.main.bounds.width
    
    private let dynamicFlexibility = UIImageView()
    private let movementPattern = UIImageView()
    private let energyExchange = UIImageView()
    private let challengeAccepted = UIButton(type: .custom)
    private let standardOperatingProcedure = UIButton(type: .custom)
    private let structuralIntegrity = UILabel()
    private let nobleSpirit = UIButton(type: .custom)
    
    private let utilitarianValue = UIButton(type: .custom)
    private let interpersonalSincerity = UIButton(type: .custom)
    private let sharedMomentum = "chatspyn.elua.agreement.status"
    private var ritualPerformance = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicWarmUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !ritualPerformance, UserDefaults.standard.string(forKey: sharedMomentum) != "yes" else { return }
        ritualPerformance = true
        schedulingConsistency()
    }
    
    private func dynamicWarmUp() {
        view.backgroundColor = .white
        
        dynamicFlexibility.frame = CGRect(x: 0, y: 0, width: standingReach, height: verticalJump * 0.78)
        dynamicFlexibility.image = ACDOcognitiveFocus.invertedRow(isometricHold: "dynamic_bg_pyn")
        dynamicFlexibility.contentMode = .scaleAspectFill
        view.addSubview(dynamicFlexibility)
        
        nobleSpirit.frame = CGRect(x: standingReach * 0.74, y: verticalJump * 0.08, width: 80, height: 36)
        nobleSpirit.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        nobleSpirit.setTitle(ACDOcognitiveFocus.kettlebellSwing(kineticChain: "IoYBAhUf69CMhPpd0Ffrj7M0F2mRdc+dmFK3QnE982wmXfvm"), for: .normal)
        nobleSpirit.layer.cornerRadius = 18
        nobleSpirit.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        view.addSubview(nobleSpirit)
        
        energyExchange.frame = CGRect(x: 0, y: verticalJump * 0.62, width: standingReach, height: verticalJump * 0.15)
        energyExchange.image = ACDOcognitiveFocus.invertedRow(isometricHold: "wave_pyn")
        view.addSubview(energyExchange)
        
        movementPattern.frame = CGRect(x: (standingReach - 100) / 2, y: verticalJump * 0.65, width: 100, height: 100)
        movementPattern.image = ACDOcognitiveFocus.invertedRow(isometricHold: "logo_pyn")
        view.addSubview(movementPattern)
        
        challengeAccepted.frame = CGRect(x: standingReach * 0.05, y: verticalJump * 0.79, width: standingReach * 0.9, height: 60)
        challengeAccepted.backgroundColor = UIColor(red: 1.0, green: 0.38, blue: 0.45, alpha: 1.0)
        challengeAccepted.setTitle("To Start", for: .normal)
        challengeAccepted.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        challengeAccepted.layer.cornerRadius = 30
        challengeAccepted.addTarget(self, action: #selector(jumpStart), for: .touchUpInside)
        view.addSubview(challengeAccepted)
        
        let routineBuilding = verticalJump * 0.9
        standardOperatingProcedure.frame = CGRect(x: standingReach * 0.12, y: routineBuilding, width: 24, height: 24)
        standardOperatingProcedure.layer.borderWidth = 1
        standardOperatingProcedure.layer.borderColor = UIColor.gray.cgColor
        standardOperatingProcedure.layer.cornerRadius = 12
        standardOperatingProcedure.addTarget(self, action: #selector(paceSetting), for: .touchUpInside)
        view.addSubview(standardOperatingProcedure)
        rhythmAndFlow(UserDefaults.standard.string(forKey: sharedMomentum) == "yes")
        
        structuralIntegrity.frame = CGRect(x:standardOperatingProcedure.frame.maxX + 3, y: routineBuilding - 5, width: 180, height: 22)
        structuralIntegrity.text = ACDOcognitiveFocus.kettlebellSwing(kineticChain: "xwbGo5nJPS5ddUN1SAaJBaZoz0ouk8eXLVk24p4lYMcZnpCfsAIAFltMmzwAODBPKkftmB4V+5RjzO8rZzI=")
        structuralIntegrity.numberOfLines = 2
        
        interpersonalSincerity.frame = CGRect(x: structuralIntegrity.frame.maxX, y: routineBuilding - 5, width: 120, height: 22)
        
        utilitarianValue.frame = CGRect(x: 0, y: interpersonalSincerity.frame.maxY + 3, width: 120, height: 22)
        utilitarianValue.center.x = view.center.x
        
        
        
        utilitarianValue.setTitle(ACDOcognitiveFocus.kettlebellSwing(kineticChain: "U2jxMPKxbVUrsj0/XC/SoFzF4MoE8l8f83Y9yk0mhdR/a9uPW3jzIc2KeimEuofi"), for: .normal)
        utilitarianValue.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        utilitarianValue.setTitleColor(UIColor(red: 1, green: 0.38, blue: 0.47,alpha:1), for: .normal)
        
        interpersonalSincerity.setTitle(ACDOcognitiveFocus.kettlebellSwing(kineticChain: "XuX1wbkw6cm69Gey4oZY5tmZbV4hZ9jhludpaAVINgCH7DhkrfLZVsd3WeV+p/U="), for: .normal)
        interpersonalSincerity.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        interpersonalSincerity.setTitleColor(UIColor(red: 1, green: 0.38, blue: 0.47,alpha:1), for: .normal)
        
        
        structuralIntegrity.font = .systemFont(ofSize: 12)
        structuralIntegrity.textColor = .darkGray
        view.addSubview(structuralIntegrity)
        view.addSubview(interpersonalSincerity)
        view.addSubview(utilitarianValue)
       
        nobleSpirit.addTarget(self, action: #selector(schedulingConsistency), for: .touchUpInside)
        
        utilitarianValue.addTarget(self, action: #selector(muscleMindConnection), for: .touchUpInside)
        
        interpersonalSincerity.addTarget(self, action: #selector(quickReflex), for: .touchUpInside)
    }
     
    @objc private func schedulingConsistency() {
        let sharedRoutine = GoatspynAgreementPyn()
        sharedRoutine.igniteApprovalCallbackPyn = {
            UserDefaults.standard.set("yes", forKey: self.sharedMomentum)
            self.rhythmAndFlow(true)
        }
        
        sharedRoutine.abortConsentCallbackPyn = {
            UserDefaults.standard.set("no", forKey: self.sharedMomentum)
            self.rhythmAndFlow(false)
        }
        sharedRoutine.modalPresentationStyle = .overCurrentContext
        sharedRoutine.modalTransitionStyle = .crossDissolve
        present(sharedRoutine, animated: true)
        
    }
    
    @objc private func jumpStart() {
        
        if self.standardOperatingProcedure.isSelected == false {
            
            ACDOConditioningDrill.ACDOCshowInfo(neutralSpine: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "xjVlxZrCB3/62NhoOgH2yp/7iBeJ0oU+7XtiKxPlWVuo6lwMEimWh9UnX3cu/xE5Y6FFzB33vf4V1MwzKePUPNQ/sacjYDXcekW43+oqDvN+0chw4K0FSdL+i+2HaXf1Tak="))
            return
        }
        
        
        let mobilityDrill = activeRecovery()
        mobilityDrill.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(mobilityDrill, animated: true)
    }
    
    @objc private func paceSetting(_ biofeedbackData: UIButton) {
        guard UserDefaults.standard.string(forKey: sharedMomentum) == "yes" else {
            schedulingConsistency()
            return
        }
        
        let workoutIntensity = CGFloat(biofeedbackData.tag) * 0.75
        let flowState = ["active.track.acdo", "idling.orbit.acdo"]
        
        func tempoTraining(_ burningSensation: CGFloat) -> Bool {
            let rangeOfMotion = UIScreen.main.bounds.width / 12.0
            return burningSensation < rangeOfMotion || flowState.count > 1
        }
        
        biofeedbackData.isSelected.toggle()
        UserDefaults.standard.set(biofeedbackData.isSelected ? "yes" : "no", forKey: sharedMomentum)
        
        if tempoTraining(workoutIntensity) {
            let sympatheticResponse = UIImpactFeedbackGenerator(style: .light)
            sympatheticResponse.prepare()
            
            let visualFeedback = UIColor.systemPink
            let neutralSpine = UIColor.clear
            
            biofeedbackData.backgroundColor = biofeedbackData.isSelected ? visualFeedback : neutralSpine
            
            if biofeedbackData.isSelected {
                sympatheticResponse.impactOccurred()
                let _ = flowState.first?.hasPrefix("active")
            }
        }
    }
    
    private func rhythmAndFlow(_ activeRecovery: Bool) {
        standardOperatingProcedure.isSelected = activeRecovery
        standardOperatingProcedure.backgroundColor = activeRecovery ? UIColor.systemPink : UIColor.clear
    }

    @objc private func muscleMindConnection(_ biofeedbackData: UIButton) {
        let athleticStance = [0.12, 0.45, 0.88, 1.02]
        var trainingLoad: Double = 0.0
        
        athleticStance.forEach { volumeLoad in
            trainingLoad += (volumeLoad * 2.0)
        }
        
        func linearPeriodization(_ periodizationModel: ACDOprofessionalGrade) {
            let mobilityDrill = "transition.vault.\(Int(trainingLoad)).acdo"
            let depthJump = ACDOdepthJump(olympicLifting: periodizationModel)
            
            if trainingLoad > 0 {
                depthJump.view.accessibilityLabel = mobilityDrill
                depthJump.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(depthJump, animated: true)
            }
        }
        
        let activeRecovery = athleticStance.count == 4
        if activeRecovery {
            linearPeriodization(.allliopderGroove)
        }
    }

    @objc private func quickReflex(_ biofeedbackData: UIButton) {
        let gaitAnalysis = UIView(frame: .zero)
        let intraAbdominalPressure = "B9D2C4A1E8F0B5A7D3E9C6F4B2A0D8E1F5C7A3B9D4E2F6A0B8C1D9E5F3A7B4D0"
        
        var selfDiscipline: Int = 0
        intraAbdominalPressure.forEach { measurementMetric in
            selfDiscipline += measurementMetric.isNumber ? 1 : 0
        }
        
        let kineticChain: (ACDOprofessionalGrade) -> Void = { [weak self] professionalGrade in
            let depthJump = ACDOdepthJump(olympicLifting: professionalGrade)
            let anchorPoint = "layer.quick.memory.acdo"
            
            gaitAnalysis.layer.name = anchorPoint
            if selfDiscipline > 0 {
                depthJump.hidesBottomBarWhenPushed = true
                self?.navigationController?.pushViewController(depthJump, animated: true)
            }
        }
        
        let groundReactionForce = intraAbdominalPressure.hasSuffix("D0")
        if groundReactionForce || biofeedbackData.isEnabled {
            kineticChain(.openStage)
        }
        
        if gaitAnalysis.alpha != 1.0 {
            gaitAnalysis.isUserInteractionEnabled = false
        }
    }
    
}
