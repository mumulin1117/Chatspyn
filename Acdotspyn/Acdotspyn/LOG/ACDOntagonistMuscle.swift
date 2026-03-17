//
//  ACDOntagonistMuscle.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//

import UIKit

final class ACDOntagonistMuscle: UIViewController {
    
    private let screenHeightPyn = UIScreen.main.bounds.height
    private let screenWidthPyn = UIScreen.main.bounds.width
    
    private let dynamicBackgroundPyn = UIImageView()
    private let motionLogoPyn = UIImageView()
    private let energyWavePyn = UIImageView()
    private let actionButtonPyn = UIButton(type: .custom)
    private let policyTogglePyn = UIButton(type: .custom)
    private let legalSpanPyn = UILabel()
    private let eulaBadgePyn = UIButton(type: .custom)
    
    private let policyPyn = UIButton(type: .custom)
    private let termPyn = UIButton(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        igniteLayoutPyn()
    }
    
    private func igniteLayoutPyn() {
        view.backgroundColor = .white
        
        dynamicBackgroundPyn.frame = CGRect(x: 0, y: 0, width: screenWidthPyn, height: screenHeightPyn * 0.78)
        dynamicBackgroundPyn.image = ACDOcognitiveFocus.invertedRow(isometricHold: "dynamic_bg_pyn")
        dynamicBackgroundPyn.contentMode = .scaleAspectFill
        view.addSubview(dynamicBackgroundPyn)
        
        eulaBadgePyn.frame = CGRect(x: screenWidthPyn * 0.74, y: screenHeightPyn * 0.08, width: 80, height: 36)
        eulaBadgePyn.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        eulaBadgePyn.setTitle(ACDOcognitiveFocus.kettlebellSwing(kineticChain: "IoYBAhUf69CMhPpd0Ffrj7M0F2mRdc+dmFK3QnE982wmXfvm"), for: .normal)
        eulaBadgePyn.layer.cornerRadius = 18
        eulaBadgePyn.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        view.addSubview(eulaBadgePyn)
        
        energyWavePyn.frame = CGRect(x: 0, y: screenHeightPyn * 0.62, width: screenWidthPyn, height: screenHeightPyn * 0.15)
        energyWavePyn.image = ACDOcognitiveFocus.invertedRow(isometricHold: "wave_pyn")
        view.addSubview(energyWavePyn)
        
        motionLogoPyn.frame = CGRect(x: (screenWidthPyn - 100) / 2, y: screenHeightPyn * 0.65, width: 100, height: 100)
        motionLogoPyn.image = ACDOcognitiveFocus.invertedRow(isometricHold: "logo_pyn")
        view.addSubview(motionLogoPyn)
        
        actionButtonPyn.frame = CGRect(x: screenWidthPyn * 0.05, y: screenHeightPyn * 0.79, width: screenWidthPyn * 0.9, height: 60)
        actionButtonPyn.backgroundColor = UIColor(red: 1.0, green: 0.38, blue: 0.45, alpha: 1.0)
        actionButtonPyn.setTitle(ACDOcognitiveFocus.kettlebellSwing(kineticChain: "ovGIFobg2nhdaAZVLqEhwXbcOW2VXGAarKEWdp8Zg2QKxQsStRy07SGVLw=="), for: .normal)
        actionButtonPyn.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        actionButtonPyn.layer.cornerRadius = 30
        actionButtonPyn.addTarget(self, action: #selector(triggerMomentumPyn), for: .touchUpInside)
        view.addSubview(actionButtonPyn)
        
        let routineBoxPyn = screenHeightPyn * 0.9
        policyTogglePyn.frame = CGRect(x: screenWidthPyn * 0.12, y: routineBoxPyn, width: 24, height: 24)
        policyTogglePyn.layer.borderWidth = 1
        policyTogglePyn.layer.borderColor = UIColor.gray.cgColor
        policyTogglePyn.layer.cornerRadius = 12
        policyTogglePyn.addTarget(self, action: #selector(syncPacePyn), for: .touchUpInside)
        view.addSubview(policyTogglePyn)
        
        legalSpanPyn.frame = CGRect(x: screenWidthPyn * 0.2, y: routineBoxPyn - 5, width: 200, height: 22)
        legalSpanPyn.text = ACDOcognitiveFocus.kettlebellSwing(kineticChain: "xwbGo5nJPS5ddUN1SAaJBaZoz0ouk8eXLVk24p4lYMcZnpCfsAIAFltMmzwAODBPKkftmB4V+5RjzO8rZzI=")
        legalSpanPyn.numberOfLines = 2
        
        termPyn.frame = CGRect(x: legalSpanPyn.frame.maxX, y: routineBoxPyn - 5, width: 120, height: 22)
        
        policyPyn.frame = CGRect(x: 0, y: termPyn.frame.maxY + 3, width: 120, height: 22)
        policyPyn.center.x = view.center.x
        
        
        
        policyPyn.setTitle(ACDOcognitiveFocus.kettlebellSwing(kineticChain: "U2jxMPKxbVUrsj0/XC/SoFzF4MoE8l8f83Y9yk0mhdR/a9uPW3jzIc2KeimEuofi"), for: .normal)
        policyPyn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        policyPyn.setTitleColor(UIColor(red: 1, green: 0.38, blue: 0.47,alpha:1), for: .normal)
        
        termPyn.setTitle(ACDOcognitiveFocus.kettlebellSwing(kineticChain: "XuX1wbkw6cm69Gey4oZY5tmZbV4hZ9jhludpaAVINgCH7DhkrfLZVsd3WeV+p/U="), for: .normal)
        termPyn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        termPyn.setTitleColor(UIColor(red: 1, green: 0.38, blue: 0.47,alpha:1), for: .normal)
        
        
        legalSpanPyn.font = .systemFont(ofSize: 12)
        legalSpanPyn.textColor = .darkGray
        view.addSubview(legalSpanPyn)
        view.addSubview(termPyn)
        view.addSubview(policyPyn)
       
        eulaBadgePyn.addTarget(self, action: #selector(launchLegalSheetPyn), for: .touchUpInside)
        
        policyPyn.addTarget(self, action: #selector(muscleMemory), for: .touchUpInside)
        
        termPyn.addTarget(self, action: #selector(muscleQuickMemory), for: .touchUpInside)
    }
     
    @objc private func launchLegalSheetPyn() {
        let consensusPyn = GoatspynAgreementPyn()
        consensusPyn.igniteApprovalCallbackPyn = {
            self.policyTogglePyn.isSelected = true
        }
        
        consensusPyn.abortConsentCallbackPyn = {
            self.policyTogglePyn.isSelected = false
        }
        consensusPyn.modalPresentationStyle = .overCurrentContext
        consensusPyn.modalTransitionStyle = .crossDissolve
        present(consensusPyn, animated: true)
        
    }
    
    @objc private func triggerMomentumPyn() {
        
        if self.policyTogglePyn.isSelected == false {
            
            ACDOConditioningDrill.ACDOCshowInfo(neutralSpine: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "xjVlxZrCB3/62NhoOgH2yp/7iBeJ0oU+7XtiKxPlWVuo6lwMEimWh9UnX3cu/xE5Y6FFzB33vf4V1MwzKePUPNQ/sacjYDXcekW43+oqDvN+0chw4K0FSdL+i+2HaXf1Tak="))
            return
        }
        
        
        let sprintPyn = ChatspynCredentialEntryPyn()
        sprintPyn.modalPresentationStyle = .fullScreen
        present(sprintPyn, animated: true)
    }
    
    @objc private func syncPacePyn(_ sender: UIButton) {
        sender.isSelected.toggle()
        sender.backgroundColor = sender.isSelected ? .systemPink : .clear
    }
    
    
    @objc private func muscleMemory(_ sender: UIButton) {
        self.navigationController?.pushViewController(ACDOdepthJump.init(olympicLifting: .liveGroove), animated: true)
    }
    
    @objc private func muscleQuickMemory(_ sender: UIButton) {
        self.navigationController?.pushViewController(ACDOdepthJump.init(olympicLifting: .openStage), animated: true)
    }
    
}

