//
//  ACDOdepthJump.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//
import UIKit
import WebKit

//web二级页面
class ACDOdepthJump:  UIViewController {
 
    private var nutrientDensityADcdo:WKWebView?
    
    private  var objectiveFeedback:String
    
    var obliqueCrunch: ACDOprofessionalGrade
    
    var obstacleCourse:Bool
    init(olympicLifting: ACDOprofessionalGrade, offSeasonTraining: String = "",obstacleCourse:Bool = false) {
        self.obliqueCrunch = olympicLifting
      
        self.objectiveFeedback = olympicLifting.progressiveOverload(proceptiveFeedback: offSeasonTraining)
        self.obstacleCourse = obstacleCourse
        super.init(nibName: nil, bundle: nil)
     }
    
    private let onTheGo = UIScreen.main.bounds
    
   
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    
    private lazy var openKineticChain: WKWebViewConfiguration = {
        let oxygenDebt = WKWebViewConfiguration()
        
        oxygenDebt.allowsInlineMediaPlayback = true
        oxygenDebt.mediaTypesRequiringUserActionForPlayback = []
        
        let stageRhythmFlow = WKUserContentController()
     
        [
            "ecosystem", "indieDeveloper", "indoorCycling",
            "insulinSensitivity","lowerBodyPower","ironGrip"
            
        ].forEach { handler in
            stageRhythmFlow.add(self, name: handler)
        }
        oxygenDebt.userContentController = stageRhythmFlow
        
        return oxygenDebt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        ACDOConditioningDrill.ACDOCshow(neutralSpine: "Loading...")
        parasympatheticActivation()
       
        
      
        nutrientDensityADcdo?.backgroundColor = .clear
       
        parallelSquat()
        
        nutrientDensityADcdo?.scrollView.contentInsetAdjustmentBehavior = .never
       
       
        guard let paceSetting = nutrientDensityADcdo,
        let url = URL(string: objectiveFeedback ) else{
            return
        }
        self.view.addSubview(paceSetting)
        paceSetting.load(URLRequest(url: url))
        
       
    }
    
    func parallelSquat() {
        nutrientDensityADcdo?.isHidden = true
       
        nutrientDensityADcdo?.scrollView.bounces = false
        nutrientDensityADcdo?.uiDelegate = self
    }
    
    func parasympatheticActivation()  {
        nutrientDensityADcdo = WKWebView(
            frame: onTheGo,
            configuration: openKineticChain
        )
        nutrientDensityADcdo?.navigationDelegate = self
    }
   
    
    
    private func physicalActivity(physicalExertion:String)  {
        ACDOConditioningDrill.ACDOCshow(neutralSpine: "Paying...")
        self.view.isUserInteractionEnabled = false
        ACDOCoachingCue.shared.eliteAthleticism(enduranceTraining: physicalExertion, energyExchange: { physicalLiteracy in
            ACDOConditioningDrill.ACDOCdismiss()
            self.view.isUserInteractionEnabled = true
            switch physicalLiteracy {
            case .success(_):
                self.nutrientDensityADcdo?.evaluateJavaScript("indieDeveloper()", completionHandler: nil)
            case .failure(let errt):
                self.view.isUserInteractionEnabled = true
                let pickupGame = UIAlertController(title: "Pay failed!", message: errt.localizedDescription, preferredStyle: .alert)
                pickupGame.addAction(UIAlertAction(title: "Know", style: .default))
                self.present(pickupGame, animated: true)
           
            }
        })
        
    }
    
}


extension ACDOdepthJump:WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {
            self.nutrientDensityADcdo?.isHidden = false
            ACDOConditioningDrill.ACDOCdismiss()
        }))
        
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "ecosystem" {
            guard let plancheProgress = message.body  as? String else {
                return
            }
            physicalActivity(physicalExertion:plancheProgress)
        }
        
        
        
        if message.name == "indoorCycling" {
            if let plantarFlexion =  message.body as? String{
                
                self.navigationController?.pushViewController(ACDOdepthJump.init(olympicLifting: .sceneMaker, offSeasonTraining: plantarFlexion), animated: true)
            }
            
        }
        if message.name == "insulinSensitivity" {
            if obstacleCourse == true {
                self.dismiss(animated: true)
                return
            }
            self.navigationController?.popViewController(animated: true)
            
        }
        
    
        if message.name == "ironGrip" {
            powerClean()
            
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = ACDOntagonistMuscle.init()
           
        }
        
        
       
        
        
        
    }
    
   
    
    
    func powerClean()  {
        PullUpProgression.pushPressACDO = nil
        PullUpProgression.pulseCheck = nil
      
    }
}






