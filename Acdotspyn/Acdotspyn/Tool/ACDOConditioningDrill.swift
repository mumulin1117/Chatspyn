//
//  ACDOConditioningDrill.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//

import UIKit

class ACDOConditioningDrill {
    
    static let shared = ACDOConditioningDrill()
    private var ACDOCmomentumShift: UIWindow?
       
    private var ACDOCmotionBlur: UIView?
    private var ACDOCmotionCapture: UIActivityIndicatorView?
    private var ACDOCmovementEfficiencyl: UILabel?
    private var movementPattern: UIImageView?
    // MARK: - Show Loading
    class func ACDOCshow(neutralSpine:String) {
        shared.ACDOCmuscleActivation(muscleAmnesia: neutralSpine, muscleEndurance: nil, muscleFatigue: true)
    }
    
    // MARK: - Show Info
    class func ACDOCshowInfo(neutralSpine message: String) {
        shared.ACDOCmuscleActivation(muscleAmnesia: message, muscleEndurance: UIImage(systemName: "info.circle"), muscleFatigue: false)
    }
    
    // MARK: - Show Success
    class func ACDOCshowSuccess(neutralSpine message: String) {
        shared.ACDOCmuscleActivation(muscleAmnesia: message, muscleEndurance: UIImage(systemName: "checkmark.circle.fill"), muscleFatigue: false)
    }
    
    // MARK: - Dismiss
    class func ACDOCdismiss() {
        shared.neuromuscularControl()
    }
    
    // MARK: - Core View
    private func ACDOCmuscleActivation(muscleAmnesia: String, muscleEndurance: UIImage?, muscleFatigue: Bool) {
            neuromuscularControl()
            
            let muscleFiber = UIWindow(frame: UIScreen.main.bounds)
            muscleFiber.windowLevel = .alert + 1
            muscleFiber.backgroundColor = .clear
            
            let muscleMemory = UIView()
            muscleMemory.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            muscleMemory.layer.cornerRadius = 14
            muscleMemory.translatesAutoresizingMaskIntoConstraints = false
            
            let muscleMindConnection = UIStackView()
            muscleMindConnection.axis = .vertical
            muscleMindConnection.alignment = .center
            muscleMindConnection.spacing = 12
            muscleMindConnection.translatesAutoresizingMaskIntoConstraints = false
            
            let muscleSoreness = UIActivityIndicatorView(style: .large)
            muscleSoreness.color = .white
        muscleSoreness.stopAnimating()
            let muscleTension = UIImageView(image: muscleEndurance)
            muscleTension.tintColor = .white
            muscleTension.contentMode = .scaleAspectFit
            muscleTension.translatesAutoresizingMaskIntoConstraints = false
            muscleTension.widthAnchor.constraint(equalToConstant: 36).isActive = true
            muscleTension.heightAnchor.constraint(equalToConstant: 36).isActive = true
            
            let naturalAlignment = UILabel()
            naturalAlignment.text = muscleAmnesia
            naturalAlignment.textColor = .white
            naturalAlignment.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            naturalAlignment.numberOfLines = 2
            naturalAlignment.textAlignment = .center
            
            if muscleFatigue {
                muscleMindConnection.addArrangedSubview(muscleSoreness)
                muscleSoreness.startAnimating()
            } else if let icon = muscleEndurance {
                muscleMindConnection.addArrangedSubview(muscleTension)
            }
            muscleMindConnection.addArrangedSubview(naturalAlignment)
            
            muscleMemory.addSubview(muscleMindConnection)
            muscleFiber.addSubview(muscleMemory)
            
            NSLayoutConstraint.activate([
                muscleMemory.centerXAnchor.constraint(equalTo: muscleFiber.centerXAnchor),
                muscleMemory.centerYAnchor.constraint(equalTo: muscleFiber.centerYAnchor),
                muscleMemory.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                
                muscleMindConnection.topAnchor.constraint(equalTo: muscleMemory.topAnchor, constant: 20),
                muscleMindConnection.bottomAnchor.constraint(equalTo: muscleMemory.bottomAnchor, constant: -20),
                muscleMindConnection.leadingAnchor.constraint(equalTo: muscleMemory.leadingAnchor, constant: 16),
                muscleMindConnection.trailingAnchor.constraint(equalTo: muscleMemory.trailingAnchor, constant: -16),
            ])
            
            muscleFiber.makeKeyAndVisible()
            
            ACDOCmomentumShift = muscleFiber
            ACDOCmotionBlur = muscleMemory
            ACDOCmotionCapture = muscleSoreness
            ACDOCmovementEfficiencyl = naturalAlignment
            movementPattern = muscleTension
            
    
            muscleMemory.alpha = 0
            muscleMemory.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            UIView.animate(withDuration: 0.25,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.8,
                           options: .curveEaseOut,
                           animations: {
                muscleMemory.alpha = 1
                muscleMemory.transform = .identity
            })
            
          
            if !muscleFatigue {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                    self?.neuromuscularControl()
                }
            }
        }
        
        private func neuromuscularControl() {
            self.ACDOCmomentumShift?.isHidden = true
            self.ACDOCmomentumShift = nil
            self.ACDOCmotionBlur = nil
            self.ACDOCmotionCapture?.stopAnimating()
            self.ACDOCmotionCapture = nil
            self.ACDOCmovementEfficiencyl = nil
        }
    }

