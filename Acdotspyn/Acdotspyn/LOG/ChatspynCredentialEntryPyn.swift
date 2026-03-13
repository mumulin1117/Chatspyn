//
//  ChatspynCredentialEntryPyn.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//

import UIKit
final class ChatspynCredentialEntryPyn: UIViewController {
    
    private let strideWidthPyn = UIScreen.main.bounds.width
    private let strideHeightPyn = UIScreen.main.bounds.height
    
    private let trackHeaderPyn = UIImageView()
    private let fieldEmailPyn = UITextField()
    private let fieldSecretPyn = UITextField()
    private let executePyn = UIButton(type: .custom)
    private let retreatPyn = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupArenaPyn()
    }
    
    private func setupArenaPyn() {
        trackHeaderPyn.frame = CGRect(x: 0, y: 0, width: strideWidthPyn, height: strideHeightPyn)
        trackHeaderPyn.image = UIImage(named: "entry_header_pyn")
        trackHeaderPyn.contentMode = .scaleAspectFill
        view.addSubview(trackHeaderPyn)
        
        retreatPyn.frame = CGRect(x: 20, y: 50, width: 30, height: 30)
        retreatPyn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        retreatPyn.tintColor = .black
        retreatPyn.addTarget(self, action: #selector(returnToStartPyn), for: .touchUpInside)
        view.addSubview(retreatPyn)
        
        let anchorPyn = strideHeightPyn * 0.45
        
        renderInputPyn(fieldEmailPyn, yPyn: anchorPyn, hintPyn: "Enter your email", iconPyn: "envelope")
        renderInputPyn(fieldSecretPyn, yPyn: anchorPyn + 100, hintPyn: "Enter password", iconPyn: "lock", hidePyn: true)
        
        executePyn.frame = CGRect(x: strideWidthPyn * 0.05, y: strideHeightPyn * 0.84, width: strideWidthPyn * 0.9, height: 60)
        executePyn.backgroundColor = UIColor(red: 1, green: 0.38, blue: 0.47, alpha: 1)
        executePyn.setTitle("Log in", for: .normal)
        executePyn.layer.cornerRadius = 30
        executePyn.addTarget(self, action: #selector(finishHeatPyn), for: .touchUpInside)
        view.addSubview(executePyn)
    }
    
    private func renderInputPyn(_ fieldPyn: UITextField, yPyn: CGFloat, hintPyn: String, iconPyn: String, hidePyn: Bool = false) {
        let containerPyn = UIView(frame: CGRect(x: strideWidthPyn * 0.05, y: yPyn, width: strideWidthPyn * 0.9, height: 55))
        containerPyn.layer.borderWidth = 1.5
        containerPyn.layer.borderColor = UIColor(red: 1.0, green: 0.8, blue: 0.85, alpha: 1.0).cgColor
        containerPyn.layer.cornerRadius = 15
        
        let glyphPyn = UIImageView(frame: CGRect(x: 15, y: 17, width: 20, height: 20))
        glyphPyn.image = UIImage(systemName: iconPyn)
        glyphPyn.tintColor = .systemPink
        containerPyn.addSubview(glyphPyn)
        
        fieldPyn.frame = CGRect(x: 50, y: 0, width: containerPyn.frame.width - 60, height: 55)
        fieldPyn.placeholder = hintPyn
        fieldPyn.isSecureTextEntry = hidePyn
        containerPyn.addSubview(fieldPyn)
        
        view.addSubview(containerPyn)
    }
    
    @objc private func returnToStartPyn() {
        dismiss(animated: true)
    }
    
    @objc private func finishHeatPyn() {
        guard let cadencePyn = fieldEmailPyn.text, !cadencePyn.isEmpty else { return }
        print("Authenticating motion sequence...")
    }
}
