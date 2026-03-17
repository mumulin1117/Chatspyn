//
//  ACDOarcherSquat.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//


import UIKit
struct ChatMessageEntityPyn {
    let userNamePyn: String
    let lastMsgPyn: String
    let timeStampPyn: String
    let unreadCountPyn: Int
    let isVideoPyn: Bool
}
final class ACDOarcherSquat: UIViewController {
    private var chatDataSourcePyn: [Dictionary<String,Any>] = []

    private let driftWidthPyn = UIScreen.main.bounds.width
    private let driftHeightPyn = UIScreen.main.bounds.height
    
    private let ghostEmptySlatePyn = UIView()
    private let ghostHintLabelPyn = UILabel()
    // 顶部导航容器
    private let pulseNavEnginePyn = UIView()
    private let linkTriggerPyn = UIButton(type: .custom)
    private let chatTriggerPyn = UIButton()
    private let configActionPyn = UIButton(type: .custom)
    
    // 两个核心视图容器
    private let matchmakingCanvasPyn = UIView() // Interest Link 页面
    private let dialogueCanvasPyn = UIScrollView() // Chat 列表页面
    
    // 匹配页面组件
    private let stellarBackgroundPyn = UIImageView()
    private let orbitPortalPyn = UIImageView()
    private let igniteMatchBtnPyn = UIButton(type: .custom)
    
    
    lazy var someonefert: UIImageView = {
        let askill = UIImageView.init(image: ACDOcognitiveFocus.invertedRow(isometricHold: "someonesay"))
        askill.contentMode = .scaleAspectFit
        return askill
    }()
    
    private let pauiedBtnPyn = UIButton(type: .custom)
    private var isVelocityMatchingPyn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        igniteLayoutCorePyn()
        toggleSyncModePyn(toMatchPyn: true)
    }
    private func toggleGhostSlatePyn(shouldShowPyn: Bool) {
        if shouldShowPyn {
          
            ghostEmptySlatePyn.frame = dialogueCanvasPyn.bounds
            ghostEmptySlatePyn.backgroundColor = .white
            
           
            ghostHintLabelPyn.frame = CGRect(x: 20, y: 150, width: driftWidthPyn - 40, height: 40)
            ghostHintLabelPyn.text = ACDOcognitiveFocus.kettlebellSwing(kineticChain: "TXrAj0Jjh4s0SI05UOKMdPFr1ZhdVaXdUptNKSUbrE0KSroOOZ7/cyh/W7XgMJ3XhgCqvRnqW5cz/zOXZIew")
            ghostHintLabelPyn.textAlignment = .center
            ghostHintLabelPyn.textColor = .lightGray
            ghostHintLabelPyn.font = .systemFont(ofSize: 15, weight: .medium)
            
           
            let decoIconPyn = UIImageView(frame: CGRect(x: (driftWidthPyn - 60)/2, y: 80, width: 60, height: 60))
            decoIconPyn.image = ACDOcognitiveFocus.invertedRow(isometricHold: "empty_chat_orbit_pyn")
            decoIconPyn.tintColor = UIColor(white: 0.9, alpha: 1.0)
            
            ghostEmptySlatePyn.addSubview(decoIconPyn)
            ghostEmptySlatePyn.addSubview(ghostHintLabelPyn)
            dialogueCanvasPyn.addSubview(ghostEmptySlatePyn)
            dialogueCanvasPyn.bringSubviewToFront(ghostEmptySlatePyn)
        } else {
            ghostEmptySlatePyn.removeFromSuperview()
        }
    }
    private func igniteLayoutCorePyn() {
       
        
        pulseNavEnginePyn.frame = CGRect(x: 0, y: 0, width: driftWidthPyn, height: 100 + 50)
        
        view.addSubview(pulseNavEnginePyn)
        
       
        pauiedBtnPyn.setBackgroundImage(ACDOcognitiveFocus.invertedRow(isometricHold: "pauiedBtnPyn"), for: .normal)
        pauiedBtnPyn.frame = CGRect(x: 20, y: 50 + 30 + 16, width: 107, height: 34)
        pauiedBtnPyn.addTarget(self, action: #selector(SeventLightship), for: .touchUpInside)
        pauiedBtnPyn.setTitle(ACDOcognitiveFocus.kettlebellSwing(kineticChain: "VU4crvxheHL6YR+WBjAcZCvxhfvBY8Fdk65CgPtjt+8LNL7inV6LSyoxuAQ="), for: .normal)
        pauiedBtnPyn.setTitleColor(.white, for: .normal)
        pauiedBtnPyn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        pulseNavEnginePyn.addSubview(pauiedBtnPyn)
        
       
        chatTriggerPyn.frame = CGRect(x: 20, y: 55, width: 55, height: 30)
        chatTriggerPyn.setImage(ACDOcognitiveFocus.invertedRow(isometricHold: "chat_title_pyn"), for: .normal)
        chatTriggerPyn.setImage(ACDOcognitiveFocus.invertedRow(isometricHold: "chat_title_pynpick"), for: .selected)
        
        chatTriggerPyn.addTarget(self, action: #selector(switchToChatPyn), for: .touchUpInside)
        pulseNavEnginePyn.addSubview(chatTriggerPyn)
        
        
        linkTriggerPyn.frame = CGRect(x: 20 + 55  + 10, y: 50, width: 137, height: 30)
        linkTriggerPyn.setImage(ACDOcognitiveFocus.invertedRow(isometricHold: "interest_link_btn_pyn"), for: .normal)
        linkTriggerPyn.setImage(ACDOcognitiveFocus.invertedRow(isometricHold: "interest_link_btn_pynsel"), for: .selected)
        linkTriggerPyn.addTarget(self, action: #selector(switchToLinkPyn), for: .touchUpInside)
        linkTriggerPyn.isSelected = true
        pulseNavEnginePyn.addSubview(linkTriggerPyn)
        
        
        configActionPyn.frame = CGRect(x: driftWidthPyn - 50, y: 55, width: 30, height: 30)
        configActionPyn.setImage(ACDOcognitiveFocus.invertedRow(isometricHold: "bolTuning"), for: .normal)
        configActionPyn.addTarget(self, action: #selector(tiggwership), for: .touchUpInside)
        
       
        pulseNavEnginePyn.addSubview(configActionPyn)
        
       
        matchmakingCanvasPyn.frame = CGRect(x: 0, y: 0, width: driftWidthPyn, height: driftHeightPyn)
        stellarBackgroundPyn.frame = matchmakingCanvasPyn.bounds
        stellarBackgroundPyn.image = ACDOcognitiveFocus.invertedRow(isometricHold: "skinstarbag")
        stellarBackgroundPyn.contentMode = .scaleToFill
        matchmakingCanvasPyn.addSubview(stellarBackgroundPyn)
        
        orbitPortalPyn.frame = CGRect(x: 0, y: 174, width: driftWidthPyn, height: 325)
        orbitPortalPyn.image = ACDOcognitiveFocus.invertedRow(isometricHold: "user_orbit_map_pyn")
        orbitPortalPyn.contentMode = .scaleAspectFill
        matchmakingCanvasPyn.addSubview(orbitPortalPyn)
        
        igniteMatchBtnPyn.frame = CGRect(x: (driftWidthPyn - 240) / 2, y: driftHeightPyn - 200, width: 240, height: 64)
        igniteMatchBtnPyn.setBackgroundImage(ACDOcognitiveFocus.invertedRow(isometricHold: "LinkJaioppp"), for: .normal)
        igniteMatchBtnPyn.setBackgroundImage(ACDOcognitiveFocus.invertedRow(isometricHold: "cansklk"), for: .selected)
        
        igniteMatchBtnPyn.addTarget(self, action: #selector(toggleKineticMatchPyn), for: .touchUpInside)
        
        someonefert.frame = CGRect(x:0, y: igniteMatchBtnPyn.frame.minY - 50, width: driftWidthPyn, height: 33)
        
        matchmakingCanvasPyn.addSubview(igniteMatchBtnPyn)
        matchmakingCanvasPyn.addSubview(someonefert)
        
        view.insertSubview(matchmakingCanvasPyn, belowSubview: pulseNavEnginePyn)
        
       
        dialogueCanvasPyn.frame = CGRect(x: 0, y: 100, width: driftWidthPyn, height: driftHeightPyn - 100)
        dialogueCanvasPyn.backgroundColor = .white
        dialogueCanvasPyn.isHidden = true
        dialogueCanvasPyn.showsVerticalScrollIndicator = false
        
        view.addSubview(dialogueCanvasPyn)
        
        renderDummyDialoguesPyn()
    }
  
    private func renderDummyDialoguesPyn() {
        dialogueCanvasPyn.subviews.forEach { $0.removeFromSuperview() }
        
        let cardHeightPyn: CGFloat = 88
        let sideMarginPyn: CGFloat = 16
        
        for (indexPyn, dataPyn) in chatDataSourcePyn.enumerated() {
            let yOffsetPyn = CGFloat(indexPyn) * cardHeightPyn + 10
            
            let sessionNodePyn = UIButton(frame: CGRect(x: 0, y: yOffsetPyn, width: driftWidthPyn, height: cardHeightPyn))
            sessionNodePyn.tag = indexPyn
            sessionNodePyn.addTarget(self, action: #selector(triggerChatDetailPyn(_:)), for: .touchUpInside)
            dialogueCanvasPyn.addSubview(sessionNodePyn)
            
            let portraitSizePyn: CGFloat = 64
            let portraitPyn = UIImageView(frame: CGRect(x: sideMarginPyn, y: (cardHeightPyn - portraitSizePyn)/2, width: portraitSizePyn, height: portraitSizePyn))
            portraitPyn.image = ACDOcognitiveFocus.invertedRow(isometricHold: "avatar_mock_pyn")
            portraitPyn.layer.cornerRadius = portraitSizePyn / 2
            portraitPyn.clipsToBounds = true
            portraitPyn.contentMode = .scaleAspectFill
            sessionNodePyn.addSubview(portraitPyn)
            
          
            let videoBadgePyn = UIImageView(frame: CGRect(x: portraitPyn.frame.maxX - 20, y: portraitPyn.frame.minY, width: 24, height: 24))
            videoBadgePyn.image = ACDOcognitiveFocus.invertedRow(isometricHold: "video_status_icon_pyn")
            sessionNodePyn.addSubview(videoBadgePyn)
           
            let bubbleWidthPyn = driftWidthPyn - portraitPyn.frame.maxX - 25
            let bubblePyn = UIView(frame: CGRect(x: portraitPyn.frame.maxX + 8, y: 12, width: bubbleWidthPyn, height: 64))
            bubblePyn.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
            bubblePyn.layer.cornerRadius = 16
            bubblePyn.isUserInteractionEnabled = false // 让点击事件穿透到父视图按钮
            sessionNodePyn.addSubview(bubblePyn)
            
            let nameLabelPyn = UILabel(frame: CGRect(x: 12, y: 10, width: 150, height: 20))
            nameLabelPyn.text = dataPyn["eliteAthleticism"] as? String //.userNamePyn
            nameLabelPyn.font = .systemFont(ofSize: 16, weight: .bold)
            nameLabelPyn.textColor = .black
            bubblePyn.addSubview(nameLabelPyn)
            
         
            let statusLabelPyn = UILabel(frame: CGRect(x: 12, y: 34, width: 150, height: 18))
            statusLabelPyn.text = dataPyn["energyExpenditure"] as? String
            statusLabelPyn.font = .systemFont(ofSize: 14, weight: .medium)
            statusLabelPyn.textColor = .gray
            bubblePyn.addSubview(statusLabelPyn)
          
            let timeLabelPyn = UILabel(frame: CGRect(x: bubbleWidthPyn - 80, y: 10, width: 70, height: 18))
            timeLabelPyn.text = ChatspynTimeClockPyn.driftTimestampToTextPyn(dataPyn["externalRotation"] as? Int ?? 0)
            timeLabelPyn.font = .systemFont(ofSize: 11, weight: .regular)
            timeLabelPyn.textColor = .lightGray
            timeLabelPyn.textAlignment = .right
            bubblePyn.addSubview(timeLabelPyn)
            
           

            dialogueCanvasPyn.contentSize = CGSize(width: driftWidthPyn, height: yOffsetPyn + cardHeightPyn + 50)
        }
    }

 
    func refreshKineticChatPyn() {
        DispatchQueue.main.async {
            ACDOConditioningDrill.ACDOCshow(neutralSpine: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "/LlPO8FHRiEP6pK4DhjCsnhbU4vkz1dO00yIh/oyVKOHFEOVgLO1FwDEjA=="))
        }
        
        PullUpProgression.quickReflex(rangeOfMotion: "/ysfspohz/nsmgygftwmxqrx", rapidResponse: ["eccentricLoading":"32909657"]) { [weak self] pulsePyn in
            guard let self = self else { return }
            ACDOConditioningDrill.ACDOCdismiss()
            
            guard let secure = pulsePyn as? [String: Any],
                  let igniteApproval = secure[ACDOcognitiveFocus.kettlebellSwing(kineticChain: "yfjO6CLY7DkCrDxsHco79MzGT0JYZpjPRAeC77se7r+Ssg0z")] as? Array<Dictionary<String,Any>>
            else {
                self.toggleGhostSlatePyn(shouldShowPyn: true)
                return
            }
            
           
            self.chatDataSourcePyn = igniteApproval.map { dix in
                if let ADCOi = (dix["elbowDrive"] as? Array<[String:Any]>)?.first {
                    return ADCOi
                } else {
                    return [:]
                }
            }.filter { !$0.isEmpty }
            
       
            if self.chatDataSourcePyn.isEmpty {
                self.toggleGhostSlatePyn(shouldShowPyn: true)
            } else {
                self.toggleGhostSlatePyn(shouldShowPyn: false)
                self.renderDummyDialoguesPyn()
            }
            
        } realTimeCoaching: { [weak self] igniteApproval in
            ACDOConditioningDrill.ACDOCdismiss()
            self?.toggleGhostSlatePyn(shouldShowPyn: true)
            ACDOConditioningDrill.ACDOCshowInfo(neutralSpine: igniteApproval.localizedDescription)
        }
    }

  
    @objc private func switchToChatPyn() {
        toggleSyncModePyn(toMatchPyn: false)
     
        refreshKineticChatPyn()
    }

  
    @objc private func triggerChatDetailPyn(_ sender: UIButton) {
        let selectedDataPyn = chatDataSourcePyn[sender.tag]["elevatedHeartRate"] as? Int ?? 0
 
        let detailPym = ACDOdepthJump.init(olympicLifting: .spotlightAura,offSeasonTraining: "\(selectedDataPyn)")
        
        self.navigationController?.pushViewController(detailPym, animated: true)
    }

  
    @objc func tiggwership(){
        let detailPym = ACDOdepthJump.init(olympicLifting: .artBeat)
        
        self.navigationController?.pushViewController(detailPym, animated: true)
    }
    

    @objc func SeventLightship(){
        let detailPym = ACDOdepthJump.init(olympicLifting: .streetScene)
        
        self.navigationController?.pushViewController(detailPym, animated: true)
        
    }
    
    @objc private func switchToLinkPyn() {
        toggleSyncModePyn(toMatchPyn: true)
        
    }
    

    private func toggleSyncModePyn(toMatchPyn: Bool) {
        matchmakingCanvasPyn.isHidden = !toMatchPyn
        dialogueCanvasPyn.isHidden = toMatchPyn
        
        if toMatchPyn {
            linkTriggerPyn.isSelected = true
            chatTriggerPyn.isSelected = false
            pauiedBtnPyn.isHidden = false
            
          
        } else {
            linkTriggerPyn.isSelected = false
            chatTriggerPyn.isSelected = true
            pauiedBtnPyn.isHidden = true
        }
        
        
    }
    
    @objc private func toggleKineticMatchPyn() {
        isVelocityMatchingPyn.toggle()
        
        if isVelocityMatchingPyn {
        
            igniteMatchBtnPyn.isSelected = true
        
            UIView.animate(withDuration: 1.0, delay: 0, options: [.autoreverse, .repeat]) {
                self.orbitPortalPyn.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                
                self.someonefert.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
                
                self.igniteMatchBtnPyn.isSelected = false
                self.someonefert.layer.removeAllAnimations()
                self.orbitPortalPyn.layer.removeAllAnimations()
                self.orbitPortalPyn.transform = .identity
                self.someonefert.transform = .identity
                self.isVelocityMatchingPyn = false
                let detailPym = ACDOdepthJump.init(olympicLifting: .expressPulse)
                
                self.navigationController?.pushViewController(detailPym, animated: true)
                
                
                
            }))
        } else {
           
            igniteMatchBtnPyn.isSelected = false
            someonefert.layer.removeAllAnimations()
            orbitPortalPyn.layer.removeAllAnimations()
            orbitPortalPyn.transform = .identity
            self.someonefert.transform = .identity
        }
    }
}
