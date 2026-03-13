//
//  GoatspyngaitAnalysis.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//

import UIKit

class GoatspyngaitAnalysis: UITabBarController {
    
    private let staminaTrackPyn = UIView()
    private let velocityStackPyn = UIStackView()
    private let flexWidthPyn = UIScreen.main.bounds.width * 0.9
    private let flexHeightPyn: CGFloat = 72
    
    private var athleticNodesPyn = [UIButton]()
    private let pulseIconsPyn = ["activeRecoverya", "activeRecoveryb", "activeRecoveryc", "activeRecoveryd"]
    private let kineticLabelsPyn = ["activeRecoverydd","activeRecoveryaa", "activeRecoverybb", "activeRecoverycc" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        igniteCoreViewPyn()
        mountCustomTrackPyn()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        staminaTrackPyn.frame = CGRect(
            x: (view.bounds.width - flexWidthPyn) / 2,
            y: view.bounds.height - flexHeightPyn - 34,
            width: flexWidthPyn,
            height: flexHeightPyn
        )
    }

    private func igniteCoreViewPyn() {
        let circuitAlphaPyn = ACDObarbellRow() // Mock Home
        circuitAlphaPyn.view.backgroundColor = .systemBackground
        
        let circuitBetaPyn = ACDObackPedal() // Mock Workout
        let circuitGammaPyn = ACDOarcherSquat() // Mock Chat
        let circuitDeltaPyn = ACDOSalMetabolicRate() // Mock Me
        
        viewControllers = [circuitAlphaPyn, circuitBetaPyn, circuitGammaPyn, circuitDeltaPyn]
        tabBar.isHidden = true
    }

    private func mountCustomTrackPyn() {
        staminaTrackPyn.backgroundColor = UIColor(red: 0.1, green: 0.12, blue: 0.15, alpha: 1.0)
        staminaTrackPyn.layer.cornerRadius = flexHeightPyn / 2
        staminaTrackPyn.layer.shadowColor = UIColor.black.cgColor
        staminaTrackPyn.layer.shadowOpacity = 0.3
        staminaTrackPyn.layer.shadowOffset = CGSize(width: 0, height: 10)
        staminaTrackPyn.layer.shadowRadius = 15
        view.addSubview(staminaTrackPyn)

        velocityStackPyn.axis = .horizontal
        velocityStackPyn.distribution = .fillEqually
        velocityStackPyn.alignment = .center
        velocityStackPyn.frame = CGRect(x: 10, y: 0, width: flexWidthPyn - 20, height: flexHeightPyn)
        staminaTrackPyn.addSubview(velocityStackPyn)

        for i in 0..<pulseIconsPyn.count {
            let nodePyn = UIButton(type: .custom)
            nodePyn.tag = i
            nodePyn.addTarget(self, action: #selector(switchMomentumPyn(_:)), for: .touchUpInside)
            nodePyn.setImage(UIImage(named: pulseIconsPyn[i])?.withRenderingMode(.alwaysOriginal), for: .selected)
            nodePyn.setImage(UIImage(named: kineticLabelsPyn[i])?.withRenderingMode(.alwaysOriginal), for: .normal)
            if i == 0 {
                nodePyn.isSelected = true

            }
            
            athleticNodesPyn.append(nodePyn)
            velocityStackPyn.addArrangedSubview(nodePyn)
            
            if i == 0 {
                nodePyn.translatesAutoresizingMaskIntoConstraints = false
                nodePyn.heightAnchor.constraint(equalToConstant: 44).isActive = true
            }
        }
    }

    @objc private func switchMomentumPyn(_ sender: UIButton) {
        let targetIndexPyn = sender.tag
        selectedIndex = targetIndexPyn
        
        for (index, node) in athleticNodesPyn.enumerated() {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
                if index == targetIndexPyn {
                    node.isSelected = true
                } else {
                    node.isSelected = false

                }
            }
        }
    }
}
