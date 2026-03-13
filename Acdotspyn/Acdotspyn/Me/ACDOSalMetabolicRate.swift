//
//  ACDOSalMetabolicRate.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//

import UIKit

class ACDOSalMetabolicRate:  UIViewController {
    
    private let driftWidthPyn = UIScreen.main.bounds.width
    private let driftHeightPyn = UIScreen.main.bounds.height
    
    private let kineticScrollerPyn = UIScrollView()
    private let profileHeaderPyn = UIView()
    private let avatarOrbitPyn = UIImageView()
    private let aliasLabelPyn = UILabel()
    private let editBadgePyn = UIButton()
    
    private let metricsStackPyn = UIStackView()
    private let vaultBannerPyn = UIButton(type: .custom)
    
    private var activityGalleryPyn: [String] = []
    private var momentGalleryPyn: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        igniteCoreLayoutPyn()
        syncRemoteMockDataPyn()
    }
    
    private func igniteCoreLayoutPyn() {
        view.backgroundColor = UIColor(white: 0.96, alpha: 1.0)
        editBadgePyn.setImage(UIImage.init(named: "Mesversation"), for: .normal)
        
        
        kineticScrollerPyn.frame = view.bounds
        kineticScrollerPyn.contentInsetAdjustmentBehavior = .never
        kineticScrollerPyn.showsVerticalScrollIndicator = false
        view.addSubview(kineticScrollerPyn)
        
        let headerHeightPyn = driftHeightPyn * 0.42
        profileHeaderPyn.frame = CGRect(x: 0, y: 0, width: driftWidthPyn, height: headerHeightPyn)
        profileHeaderPyn.backgroundColor = .white
        kineticScrollerPyn.addSubview(profileHeaderPyn)
        
        let titlePyn = UILabel(frame: CGRect(x: 20, y: 50, width: 120, height: 40))
        titlePyn.text = "Profile"
        titlePyn.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titlePyn.textColor = .black
        profileHeaderPyn.addSubview(titlePyn)
        
        let gearPyn = UIButton(frame: CGRect(x: driftWidthPyn - 50, y: 55, width: 30, height: 30))
        gearPyn.setImage(UIImage(named: "gearshapeop"), for: .normal)
        gearPyn.tintColor = .black
        profileHeaderPyn.addSubview(gearPyn)
        
        let avatarSizePyn = driftWidthPyn * 0.24
        avatarOrbitPyn.frame = CGRect(x: (driftWidthPyn - avatarSizePyn)/2, y: 100, width: avatarSizePyn, height: avatarSizePyn)
        avatarOrbitPyn.layer.cornerRadius = avatarSizePyn / 2
        avatarOrbitPyn.clipsToBounds = true
        avatarOrbitPyn.layer.borderWidth = 3
        avatarOrbitPyn.layer.borderColor = UIColor.lightGray.cgColor
        avatarOrbitPyn.contentMode = .scaleAspectFill
        avatarOrbitPyn.image = UIImage(named: "sherry_portrait_pyn")
        profileHeaderPyn.addSubview(avatarOrbitPyn)
        
        aliasLabelPyn.frame = CGRect(x: (driftWidthPyn - 150)/2, y: avatarOrbitPyn.frame.maxY + 10, width: 150, height: 25)
        aliasLabelPyn.textAlignment = .center
        aliasLabelPyn.font = .systemFont(ofSize: 18, weight: .medium)
        aliasLabelPyn.textColor = UIColor(red: 1, green: 0.38, blue: 0.47, alpha: 1)
        profileHeaderPyn.addSubview(aliasLabelPyn)
        editBadgePyn.frame = CGRect(x: (driftWidthPyn - 150)/2 + 150, y: avatarOrbitPyn.frame.maxY + 10, width: 30, height: 30)
        profileHeaderPyn.addSubview(self.editBadgePyn)
        
        metricsStackPyn.frame = CGRect(x: 20, y: aliasLabelPyn.frame.maxY + 20, width: driftWidthPyn - 40, height: 60)
        metricsStackPyn.axis = .horizontal
        metricsStackPyn.distribution = .fillEqually
        profileHeaderPyn.addSubview(metricsStackPyn)
        
        assembleMetricsPyn(valPyn: "0", tagPyn: "Following")
        assembleMetricsPyn(valPyn: "0", tagPyn: "Followers")
        assembleMetricsPyn(valPyn: "0", tagPyn: "Like")
        
        vaultBannerPyn.frame = CGRect(x: 20, y: metricsStackPyn.frame.maxY + 15, width: driftWidthPyn - 40, height: 50)
        vaultBannerPyn.layer.cornerRadius = 25
        vaultBannerPyn.clipsToBounds = true
        vaultBannerPyn.setBackgroundImage(createGradientPyn(), for: .normal)
        vaultBannerPyn.setTitle("   My coins", for: .normal)
        vaultBannerPyn.setImage(UIImage.init(named: "ComDiosp"), for: .normal)
        
        
        vaultBannerPyn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        vaultBannerPyn.addTarget(self, action: #selector(triggerVaultPyn), for: .touchUpInside)
        profileHeaderPyn.addSubview(vaultBannerPyn)
        
        renderSectionPyn(titlePyn: "Meet Up & Move", yAxisPyn: profileHeaderPyn.frame.maxY + 20, isEmptyPyn: true)
        renderSectionPyn(titlePyn: "Dynamic", yAxisPyn: profileHeaderPyn.frame.maxY + 160, isEmptyPyn: true)
        
        kineticScrollerPyn.contentSize = CGSize(width: driftWidthPyn, height: profileHeaderPyn.frame.maxY + 400)
    }
    
    private func assembleMetricsPyn(valPyn: String, tagPyn: String) {
        let containerPyn = UIView()
        let valLblPyn = UILabel(frame: CGRect(x: 0, y: 5, width: (driftWidthPyn-40)/3, height: 25))
        valLblPyn.text = valPyn
        valLblPyn.textAlignment = .center
        valLblPyn.font = .systemFont(ofSize: 20, weight: .bold)
        
        let tagLblPyn = UILabel(frame: CGRect(x: 0, y: 30, width: (driftWidthPyn-40)/3, height: 20))
        tagLblPyn.text = tagPyn
        tagLblPyn.textAlignment = .center
        tagLblPyn.font = .systemFont(ofSize: 14, weight: .regular)
        tagLblPyn.textColor = .gray
        
        containerPyn.addSubview(valLblPyn)
        containerPyn.addSubview(tagLblPyn)
        metricsStackPyn.addArrangedSubview(containerPyn)
    }
    
    private func renderSectionPyn(titlePyn: String, yAxisPyn: CGFloat, isEmptyPyn: Bool) {
        let titleLblPyn = UILabel(frame: CGRect(x: 20, y: yAxisPyn, width: 200, height: 30))
        titleLblPyn.text = titlePyn
        titleLblPyn.font = .systemFont(ofSize: 20, weight: .bold)
        kineticScrollerPyn.addSubview(titleLblPyn)
        
        if isEmptyPyn {
            let emptyHostPyn = UIView(frame: CGRect(x: 20, y: titleLblPyn.frame.maxY + 10, width: driftWidthPyn - 40, height: 80))
            emptyHostPyn.backgroundColor = .white
            emptyHostPyn.layer.cornerRadius = 15
            
            let hintPyn = UILabel(frame: emptyHostPyn.bounds)
            hintPyn.text = "No data available"
            hintPyn.textAlignment = .center
            hintPyn.textColor = .lightGray
            hintPyn.font = .systemFont(ofSize: 14)
            emptyHostPyn.addSubview(hintPyn)
            kineticScrollerPyn.addSubview(emptyHostPyn)
        }
    }
    
    private func createGradientPyn() -> UIImage? {
        let layerPyn = CAGradientLayer()
        layerPyn.colors = [UIColor.systemPink.cgColor, UIColor.orange.cgColor]
        layerPyn.startPoint = CGPoint(x: 0, y: 0.5)
        layerPyn.endPoint = CGPoint(x: 1, y: 0.5)
        layerPyn.frame = CGRect(x: 0, y: 0, width: driftWidthPyn - 40, height: 50)
        UIGraphicsBeginImageContext(layerPyn.frame.size)
        layerPyn.render(in: UIGraphicsGetCurrentContext()!)
        let imgPyn = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imgPyn
    }
    
    private func syncRemoteMockDataPyn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.aliasLabelPyn.text = "Sherry"
            self.activityGalleryPyn = []
            self.momentGalleryPyn = []
            let impactPyn = UIImpactFeedbackGenerator(style: .medium)
            impactPyn.impactOccurred()
        }
    }
    
    @objc private func triggerVaultPyn() {
        let pulsePyn = CABasicAnimation(keyPath: "transform.scale")
        pulsePyn.duration = 0.1
        pulsePyn.repeatCount = 1
        pulsePyn.autoreverses = true
        pulsePyn.fromValue = 1.0
        pulsePyn.toValue = 0.95
        vaultBannerPyn.layer.add(pulsePyn, forKey: nil)
    }
}
