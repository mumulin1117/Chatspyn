//
//  ACDObackPedal.swift
//  Acdotspyn
//
//  Created by mumu on 2026/3/12.
//


import UIKit

final class ACDObackPedal: UIViewController {
    
    private let driftWidthPyn = UIScreen.main.bounds.width
    private let driftHeightPyn = UIScreen.main.bounds.height
    
    private let motionTablePyn = UITableView()
    private let headerVisualPyn = UIImageView()
    private let composeActionPyn = UIButton(type: .custom)
    
    private var kineticDataPyn: [MomentumEntityPyn] = []
    
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
    
    private func syncAthleticDataPyn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.kineticDataPyn = [
                MomentumEntityPyn(userPyn: "Ethan H.", isVideoPyn: false),
                MomentumEntityPyn(userPyn: "Ethan H.", isVideoPyn: true)
            ]
            self.motionTablePyn.reloadData()
        }
    }
}

extension ACDObackPedal: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kineticDataPyn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellPyn = tableView.dequeueReusableCell(withIdentifier: "MomentumPulseCellPyn", for: indexPath) as! MomentumPulseCellPyn
        cellPyn.configureFramePyn(kineticDataPyn[indexPath.row])
        return cellPyn
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return driftHeightPyn * 0.52
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let focalPointPyn = UIViewController()
        focalPointPyn.view.backgroundColor = .white
        present(focalPointPyn, animated: true)
    }
}
