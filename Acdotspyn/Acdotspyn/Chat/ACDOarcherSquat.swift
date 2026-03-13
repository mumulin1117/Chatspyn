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
    private var chatDataSourcePyn: [ChatMessageEntityPyn] = []

    private let driftWidthPyn = UIScreen.main.bounds.width
    private let driftHeightPyn = UIScreen.main.bounds.height
    
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
        let askill = UIImageView.init(image: UIImage.init(named: "someonesay"))
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
    
    private func igniteLayoutCorePyn() {
  
        pulseNavEnginePyn.frame = CGRect(x: 0, y: 0, width: driftWidthPyn, height: 100 + 50)
        
        view.addSubview(pulseNavEnginePyn)
        
       
        pauiedBtnPyn.setBackgroundImage(UIImage.init(named: "pauiedBtnPyn"), for: .normal)
        pauiedBtnPyn.frame = CGRect(x: 20, y: 50 + 30 + 16, width: 107, height: 34)
        
        pauiedBtnPyn.setTitle("   My Blance", for: .normal)
        pauiedBtnPyn.setTitleColor(.white, for: .normal)
        pauiedBtnPyn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        pulseNavEnginePyn.addSubview(pauiedBtnPyn)
        
       
        chatTriggerPyn.frame = CGRect(x: 20, y: 55, width: 55, height: 30)
        chatTriggerPyn.setImage(UIImage(named: "chat_title_pyn"), for: .normal)
        chatTriggerPyn.setImage(UIImage(named: "chat_title_pynpick"), for: .selected)
        
        chatTriggerPyn.addTarget(self, action: #selector(switchToChatPyn), for: .touchUpInside)
        pulseNavEnginePyn.addSubview(chatTriggerPyn)
        
        
        linkTriggerPyn.frame = CGRect(x: 20 + 55  + 10, y: 50, width: 137, height: 30)
        linkTriggerPyn.setImage(UIImage(named: "interest_link_btn_pyn"), for: .normal)
        linkTriggerPyn.setImage(UIImage(named: "interest_link_btn_pynsel"), for: .selected)
        linkTriggerPyn.addTarget(self, action: #selector(switchToLinkPyn), for: .touchUpInside)
        linkTriggerPyn.isSelected = true
        pulseNavEnginePyn.addSubview(linkTriggerPyn)
        
        
        configActionPyn.frame = CGRect(x: driftWidthPyn - 50, y: 55, width: 30, height: 30)
        configActionPyn.setImage(UIImage(named: "bolTuning"), for: .normal)
        pulseNavEnginePyn.addSubview(configActionPyn)
        
       
        matchmakingCanvasPyn.frame = CGRect(x: 0, y: 0, width: driftWidthPyn, height: driftHeightPyn)
        stellarBackgroundPyn.frame = matchmakingCanvasPyn.bounds
        stellarBackgroundPyn.image = UIImage(named: "skinstarbag")
        stellarBackgroundPyn.contentMode = .scaleToFill
        matchmakingCanvasPyn.addSubview(stellarBackgroundPyn)
        
        orbitPortalPyn.frame = CGRect(x: 0, y: 174, width: driftWidthPyn, height: 325)
        orbitPortalPyn.image = UIImage(named: "user_orbit_map_pyn")
        orbitPortalPyn.contentMode = .scaleAspectFill
        matchmakingCanvasPyn.addSubview(orbitPortalPyn)
        
        igniteMatchBtnPyn.frame = CGRect(x: (driftWidthPyn - 240) / 2, y: driftHeightPyn - 200, width: 240, height: 64)
        igniteMatchBtnPyn.setBackgroundImage(UIImage.init(named: "LinkJaioppp"), for: .normal)
        igniteMatchBtnPyn.setBackgroundImage(UIImage.init(named: "cansklk"), for: .selected)
        
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
            portraitPyn.image = UIImage(named: "avatar_mock_pyn") // 替换为实际头像名
            portraitPyn.layer.cornerRadius = portraitSizePyn / 2
            portraitPyn.clipsToBounds = true
            portraitPyn.contentMode = .scaleAspectFill
            sessionNodePyn.addSubview(portraitPyn)
            
          
            if dataPyn.isVideoPyn {
                let videoBadgePyn = UIImageView(frame: CGRect(x: portraitPyn.frame.maxX - 20, y: portraitPyn.frame.minY, width: 24, height: 24))
                videoBadgePyn.image = UIImage(named: "video_status_icon_pyn")
                sessionNodePyn.addSubview(videoBadgePyn)
            }
           
            let bubbleWidthPyn = driftWidthPyn - portraitPyn.frame.maxX - 25
            let bubblePyn = UIView(frame: CGRect(x: portraitPyn.frame.maxX + 8, y: 12, width: bubbleWidthPyn, height: 64))
            bubblePyn.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
            bubblePyn.layer.cornerRadius = 16
            bubblePyn.isUserInteractionEnabled = false // 让点击事件穿透到父视图按钮
            sessionNodePyn.addSubview(bubblePyn)
            
            let nameLabelPyn = UILabel(frame: CGRect(x: 12, y: 10, width: 150, height: 20))
            nameLabelPyn.text = dataPyn.userNamePyn
            nameLabelPyn.font = .systemFont(ofSize: 16, weight: .bold)
            nameLabelPyn.textColor = .black
            bubblePyn.addSubview(nameLabelPyn)
            
         
            let statusLabelPyn = UILabel(frame: CGRect(x: 12, y: 34, width: 150, height: 18))
            statusLabelPyn.text = dataPyn.lastMsgPyn
            statusLabelPyn.font = .systemFont(ofSize: 14, weight: .medium)
            statusLabelPyn.textColor = .gray
            bubblePyn.addSubview(statusLabelPyn)
          
            let timeLabelPyn = UILabel(frame: CGRect(x: bubbleWidthPyn - 80, y: 10, width: 70, height: 18))
            timeLabelPyn.text = dataPyn.timeStampPyn
            timeLabelPyn.font = .systemFont(ofSize: 11, weight: .regular)
            timeLabelPyn.textColor = .lightGray
            timeLabelPyn.textAlignment = .right
            bubblePyn.addSubview(timeLabelPyn)
            
           
            if dataPyn.unreadCountPyn > 0 {
                let badgeSizePyn: CGFloat = 18
                let badgePyn = UILabel(frame: CGRect(x: bubbleWidthPyn - 25, y: 35, width: badgeSizePyn, height: badgeSizePyn))
                badgePyn.backgroundColor = UIColor.systemRed.withAlphaComponent(0.8)
                badgePyn.textColor = .white
                badgePyn.text = "\(dataPyn.unreadCountPyn)"
                badgePyn.font = .systemFont(ofSize: 10, weight: .bold)
                badgePyn.textAlignment = .center
                badgePyn.layer.cornerRadius = badgeSizePyn / 2
                badgePyn.layer.masksToBounds = true
                bubblePyn.addSubview(badgePyn)
            }
            
            dialogueCanvasPyn.contentSize = CGSize(width: driftWidthPyn, height: yOffsetPyn + cardHeightPyn + 50)
        }
    }

 
    func refreshKineticChatPyn() {
       
        self.chatDataSourcePyn = [
            ChatMessageEntityPyn(userNamePyn: "Flechazo", lastMsgPyn: "Followed you", timeStampPyn: "10:31AM", unreadCountPyn: 1, isVideoPyn: true),
            ChatMessageEntityPyn(userNamePyn: "Flechazo", lastMsgPyn: "Followed you", timeStampPyn: "10:31AM", unreadCountPyn: 1, isVideoPyn: true),
            ChatMessageEntityPyn(userNamePyn: "System", lastMsgPyn: "Welcome to Chatspyn", timeStampPyn: "09:10AM", unreadCountPyn: 0, isVideoPyn: false)
        ]
        
      
        renderDummyDialoguesPyn()
    }

  
    @objc private func switchToChatPyn() {
        toggleSyncModePyn(toMatchPyn: false)
     
        refreshKineticChatPyn()
    }

  
    @objc private func triggerChatDetailPyn(_ sender: UIButton) {
        let selectedDataPyn = chatDataSourcePyn[sender.tag]
        print("Opening chat with: \(selectedDataPyn.userNamePyn)")
        
        let detailStagePyn = UIViewController()
        detailStagePyn.view.backgroundColor = .white
     
        let pulseGenPyn = UISelectionFeedbackGenerator()
        pulseGenPyn.selectionChanged()
        
        self.present(detailStagePyn, animated: true)
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
        } else {
           
            igniteMatchBtnPyn.isSelected = false
            someonefert.layer.removeAllAnimations()
            orbitPortalPyn.layer.removeAllAnimations()
            orbitPortalPyn.transform = .identity
            self.someonefert.transform = .identity
        }
    }
}
