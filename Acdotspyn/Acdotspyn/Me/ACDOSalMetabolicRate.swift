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
        editBadgePyn.setImage(ACDOcognitiveFocus.invertedRow(isometricHold: "Mesversation"), for: .normal)
        
        
        kineticScrollerPyn.frame = view.bounds
        kineticScrollerPyn.contentInsetAdjustmentBehavior = .never
        kineticScrollerPyn.showsVerticalScrollIndicator = false
        view.addSubview(kineticScrollerPyn)
        
        let headerHeightPyn = driftHeightPyn * 0.42
        profileHeaderPyn.frame = CGRect(x: 0, y: 0, width: driftWidthPyn, height: headerHeightPyn)
        profileHeaderPyn.backgroundColor = .white
        kineticScrollerPyn.addSubview(profileHeaderPyn)
        
        let titlePyn = UILabel(frame: CGRect(x: 20, y: 50, width: 120, height: 40))
        titlePyn.text = ACDOcognitiveFocus.kettlebellSwing(kineticChain: "nmtzZZZMy2nnonluSpECXZYExzKp7mdNKyiBDj49yqq4uXeI+jW4")
        titlePyn.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titlePyn.textColor = .black
        profileHeaderPyn.addSubview(titlePyn)
        
        let gearPyn = UIButton(frame: CGRect(x: driftWidthPyn - 50, y: 55, width: 30, height: 30))
        gearPyn.setImage(ACDOcognitiveFocus.invertedRow(isometricHold: "gearshapeop"), for: .normal)
        gearPyn.tintColor = .black
        gearPyn.tag = 235
        gearPyn.addTarget(self, action: #selector(SeventLightship(eado:)), for: .touchUpInside)
        profileHeaderPyn.addSubview(gearPyn)
        
        let avatarSizePyn = driftWidthPyn * 0.24
        avatarOrbitPyn.frame = CGRect(x: (driftWidthPyn - avatarSizePyn)/2, y: 100, width: avatarSizePyn, height: avatarSizePyn)
        avatarOrbitPyn.layer.cornerRadius = avatarSizePyn / 2
        avatarOrbitPyn.clipsToBounds = true
        avatarOrbitPyn.layer.borderWidth = 3
        avatarOrbitPyn.layer.borderColor = UIColor.lightGray.cgColor
        avatarOrbitPyn.contentMode = .scaleAspectFill
        avatarOrbitPyn.image = ACDOcognitiveFocus.invertedRow(isometricHold: "sherry_portrait_pyn")
        profileHeaderPyn.addSubview(avatarOrbitPyn)
        
        aliasLabelPyn.frame = CGRect(x: (driftWidthPyn - 150)/2, y: avatarOrbitPyn.frame.maxY + 10, width: 150, height: 25)
        aliasLabelPyn.textAlignment = .center
        aliasLabelPyn.font = .systemFont(ofSize: 18, weight: .medium)
        aliasLabelPyn.textColor = UIColor(red: 1, green: 0.38, blue: 0.47, alpha: 1)
        profileHeaderPyn.addSubview(aliasLabelPyn)
        editBadgePyn.frame = CGRect(x: (driftWidthPyn - 150)/2 + 150, y: avatarOrbitPyn.frame.maxY + 10, width: 30, height: 30)
        editBadgePyn.tag = 236
        editBadgePyn.addTarget(self, action: #selector(SeventLightship(eado:)), for: .touchUpInside)
        profileHeaderPyn.addSubview(self.editBadgePyn)
        
        metricsStackPyn.frame = CGRect(x: 20, y: aliasLabelPyn.frame.maxY + 20, width: driftWidthPyn - 40, height: 60)
        metricsStackPyn.axis = .horizontal
        metricsStackPyn.distribution = .fillEqually
        profileHeaderPyn.addSubview(metricsStackPyn)
        
        assembleMetricsPyn(valPyn: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "5q0EJl+PAIkqtjL+vuByH8fOPip3tofTzqY2SiRnBd1jEQ=="), tagPyn: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "kerZJUf1GEHvaTa7c9SM/hJG3BeeXZTGINjmFFt8halhbKkrs0+BdZY="), viewtag: 237)
        assembleMetricsPyn(valPyn: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "5q0EJl+PAIkqtjL+vuByH8fOPip3tofTzqY2SiRnBd1jEQ=="), tagPyn: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "cZK5ZvW21317fM+rVws9UAcgtGaVsPv3vp5eF3I2/kI9ex22lYagOeA="), viewtag: 238)
//        assembleMetricsPyn(valPyn: "My", tagPyn: "Like", viewtag: 239)
        
        vaultBannerPyn.frame = CGRect(x: 20, y: metricsStackPyn.frame.maxY + 15, width: driftWidthPyn - 40, height: 50)
        vaultBannerPyn.layer.cornerRadius = 25
        vaultBannerPyn.clipsToBounds = true
        vaultBannerPyn.setBackgroundImage(createGradientPyn(), for: .normal)
        vaultBannerPyn.setTitle(ACDOcognitiveFocus.kettlebellSwing(kineticChain: "WCCant+/F8lwol5+1nIDzYM9b3jNKHj6ugGn4EEpfniguGK8QXFAw2R424s="), for: .normal)
        vaultBannerPyn.setImage(ACDOcognitiveFocus.invertedRow(isometricHold: "ComDiosp"), for: .normal)
        vaultBannerPyn.tag = 234
        
        vaultBannerPyn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        vaultBannerPyn.addTarget(self, action: #selector(triggerVaultPyn), for: .touchUpInside)
        profileHeaderPyn.addSubview(vaultBannerPyn)
        
        renderSectionPyn(titlePyn: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "WAHVz870uidOkDimSnIm5jUyQiqAnxXyrVUAPYZUNcqqld8X8WFDYcC68+4XSg=="), yAxisPyn: profileHeaderPyn.frame.maxY + 20, isEmptyPyn: true)
        renderSectionPyn(titlePyn: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "NeOgvf4pEvWh9qCp0cAgBzmQ2+iws7W6aOqPFYdOn+3TxZo8MUm4"), yAxisPyn: profileHeaderPyn.frame.maxY + 160, isEmptyPyn: true)
        
        kineticScrollerPyn.contentSize = CGSize(width: driftWidthPyn, height: profileHeaderPyn.frame.maxY + 400)
    }
    
    private func assembleMetricsPyn(valPyn: String, tagPyn: String,viewtag:Int) {
        let containerPyn = UIButton()
        containerPyn.tag = viewtag
        containerPyn.addTarget(self, action: #selector(SeventLightship(eado:)), for: .touchUpInside)
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
            hintPyn.text = ACDOcognitiveFocus.kettlebellSwing(kineticChain: "TrVBcaB7z8yhEzgFmdJu8Vwhkcs7nnZ8Yky9siMeLRbTF52ZSCm+MYsSUUQPm5JkUw==")
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
        DispatchQueue.main.async {
            ACDOConditioningDrill.ACDOCshow(neutralSpine: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "qLqjXB9lB6TITjzg5XgLj4nhHfG8EvigFj/yU6FK4PidQF1qoF6CZn9s3g=="))
        }
        
        PullUpProgression.quickReflex(rangeOfMotion: "/cvroviz/fssvv", rapidResponse: ["fastTwitchFiber":PullUpProgression.pushPressACDO ?? 0]) { pulsePyn in
            
            ACDOConditioningDrill.ACDOCdismiss()
            guard let secure = pulsePyn as? [String: Any],
                  let igniteApproval = secure[ACDOcognitiveFocus.kettlebellSwing(kineticChain: "yfjO6CLY7DkCrDxsHco79MzGT0JYZpjPRAeC77se7r+Ssg0z")] as? Dictionary<String,Any>
            else {
                return
            }
            self.avatarOrbitPyn.warmUpProtocol(weightBearing: igniteApproval["fieldVision"] as? String)
            self.aliasLabelPyn.text = igniteApproval["finishStrong"] as? String
            self.activityGalleryPyn = []
            self.momentGalleryPyn = []
            let impactPyn = UIImpactFeedbackGenerator(style: .medium)
            impactPyn.impactOccurred()
            
        } realTimeCoaching: { igniteApproval in
            ACDOConditioningDrill.ACDOCshowInfo(neutralSpine: igniteApproval.localizedDescription)
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
        let detailPym = ACDOdepthJump.init(olympicLifting: .streetScene)
        
        self.navigationController?.pushViewController(detailPym, animated: true)
    }
    
    
    @objc func SeventLightship(eado:UIButton){
        var enuai:ACDOprofessionalGrade = .streetScene
        
        if eado.tag == 234 {
            enuai = .streetScene
        }else if eado.tag == 235 {
            enuai = .streetRhythm
        }else if eado.tag == 236 {
            enuai =  .urbanEnergy
        }else if eado.tag == 237 {
            enuai =  .sceneWave
        }else if eado.tag == 238 {
            enuai =  .sceneWave
        }else if eado.tag == 239 {
            enuai =  .urbanEnergy
        }
        
        
        let detailPym = ACDOdepthJump.init(olympicLifting: enuai)
        
        self.navigationController?.pushViewController(detailPym, animated: true)
    }
}
