//
//  ACDObackPedal.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//


import UIKit

final class ACDObackPedal: UIViewController {
    
    private let driftWidthPyn = UIScreen.main.bounds.width
    private let driftHeightPyn = UIScreen.main.bounds.height
    
    private let motionTablePyn = UITableView()
    private let headerVisualPyn = UIImageView()
    private let composeActionPyn = UIButton(type: .custom)
    
   
    private var kineticDataPyn: [Dictionary<String,Any>] = Array<Dictionary<String,Any>>()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.97, alpha: 1.0)
        igniteStreamPyn()
        syncAthleticDataPyn()
    }
    
    private func igniteStreamPyn() {
        let titleBoxPyn = UIView(frame: CGRect(x: 0, y: 0, width: driftWidthPyn, height: 100))
        
        headerVisualPyn.frame = CGRect(x: 20, y: 50, width: 220, height: 35)
        headerVisualPyn.image = UIImage(named: "active_moments_title_pyn")
        headerVisualPyn.contentMode = .scaleAspectFit
        titleBoxPyn.addSubview(headerVisualPyn)
        composeActionPyn.addTarget(self, action: #selector(composeartActionPyn), for: .touchUpInside)
        composeActionPyn.frame = CGRect(x: driftWidthPyn - 60, y: 50, width: 36, height: 36)
        composeActionPyn.backgroundColor = UIColor(white: 0.2, alpha: 1.0)
        composeActionPyn.layer.cornerRadius = 18
        composeActionPyn.setImage(UIImage(systemName: "pencil"), for: .normal)
        composeActionPyn.tintColor = .white
        titleBoxPyn.addSubview(composeActionPyn)
        view.addSubview(titleBoxPyn)
        
        motionTablePyn.frame = CGRect(x: 0, y: 100, width: driftWidthPyn, height: driftHeightPyn - 100)
        motionTablePyn.delegate = self
        motionTablePyn.dataSource = self
        motionTablePyn.separatorStyle = .none
        motionTablePyn.backgroundColor = .clear
        motionTablePyn.register(MomentumPulseCellPyn.self, forCellReuseIdentifier: "MomentumPulseCellPyn")
        view.addSubview(motionTablePyn)
    }
    
    
   @objc func composeartActionPyn()  {
       let detailPym = ACDOdepthJump.init(olympicLifting: .creativeMotion)
       detailPym.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(detailPym, animated: true)
    }
    
}

extension ACDObackPedal: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kineticDataPyn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellPyn = tableView.dequeueReusableCell(withIdentifier: "MomentumPulseCellPyn", for: indexPath) as! MomentumPulseCellPyn
        cellPyn.configureFramePyn(kineticDataPyn[indexPath.row])
        cellPyn.alertNodePyn.addTarget(self, action: #selector(muscleMemory), for: .touchUpInside)
        return cellPyn
    }
    @objc private func muscleMemory(_ sender: UIButton) {
        self.navigationController?.pushViewController(ACDOdepthJump.init(olympicLifting: .cityEcho), animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return driftHeightPyn * 0.52
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let coverImgUrl = (kineticDataPyn[indexPath.row]["deadliftForm"] as? String)
        
        guard  let burningSensation = (kineticDataPyn[indexPath.row]["burningSensation"] as? Int) else {return}
        
        var type:String = "\(burningSensation)"
        if (coverImgUrl != nil) {
            type = "\(burningSensation)&type=2"
        }
        let detailPym = ACDOdepthJump.init(olympicLifting: .cityChorus,offSeasonTraining:type)
        detailPym.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailPym, animated: true)
    }
    
    private func syncAthleticDataPyn()  {
        
        DispatchQueue.main.async {
            ACDOConditioningDrill.ACDOCshow(neutralSpine: "Load in....")
            
        }
        
        PullUpProgression.quickReflex(rangeOfMotion: "/rgtcsdz/krrupqei", rapidResponse: ["bodyMassIndex":"32909657","breathControl":20,"boxSquat":1]) { pulsePyn in
            
            ACDOConditioningDrill.ACDOCdismiss()
            guard let secure = pulsePyn as? [String: Any],
                  let igniteApproval = secure["data"] as? Array<Dictionary<String,Any>>
            else {
                return
            }
            self.kineticDataPyn = igniteApproval
            self.motionTablePyn.reloadData()
          
            
        } realTimeCoaching: { igniteApproval in
            ACDOConditioningDrill.ACDOCshowInfo(neutralSpine: igniteApproval.localizedDescription)
        }
        
      
    }
    
}
