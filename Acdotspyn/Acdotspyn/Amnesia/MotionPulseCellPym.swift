//
//  MotionPulseCellPym.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/13.
//

import UIKit

final class MotionPulseCellPym: UICollectionViewCell {
    
    private let coverPym = UIImageView()
    private let actionIconPym = UIImageView()
    private let descPym = UILabel()
    
     let notifyAbusePym = UIButton(type: .custom)
    private let categoryBadgePym = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        coverPym.frame = CGRect(x: 0, y: 0, width: frame.width, height: 200)
        coverPym.backgroundColor = .systemGray4
        coverPym.layer.cornerRadius = 24
        coverPym.clipsToBounds = true
        coverPym.contentMode = .scaleAspectFill
        contentView.addSubview(coverPym)
        
        notifyAbusePym.frame = CGRect(x: frame.width - 35, y: 10, width: 25, height: 25)
        notifyAbusePym.setImage(UIImage(systemName: "exclamationmark.circle.fill"), for: .normal)
        notifyAbusePym.tintColor = .white.withAlphaComponent(0.8)
        notifyAbusePym.addTarget(self, action: #selector(triggerAlertReportPym), for: .touchUpInside)
        contentView.addSubview(notifyAbusePym)
        
        actionIconPym.frame = CGRect(x: frame.width - 55, y: 175, width: 48, height: 48)
        actionIconPym.image = UIImage(systemName: "arrow.up.right.circle.fill")
        actionIconPym.tintColor = UIColor(red: 0.1, green: 0.15, blue: 0.2, alpha: 1.0)
        contentView.addSubview(actionIconPym)
        
        categoryBadgePym.frame = CGRect(x: 0, y: 200, width: 75, height: 22)
        categoryBadgePym.backgroundColor = .white
        categoryBadgePym.textColor = .darkGray
        categoryBadgePym.textAlignment = .center
        categoryBadgePym.font = .systemFont(ofSize: 9, weight: .bold)
        categoryBadgePym.layer.cornerRadius = 11
        categoryBadgePym.layer.masksToBounds = true
        contentView.addSubview(categoryBadgePym)
        
        descPym.frame = CGRect(x: 0, y: categoryBadgePym.frame.maxY + 3, width: frame.width - 10, height: 30)
        
        descPym.font = .systemFont(ofSize: 14, weight: .bold)
        descPym.numberOfLines = 1
        contentView.addSubview(descPym)
    }
    
    @objc private func triggerAlertReportPym() {
        let selectionPym = UISelectionFeedbackGenerator()
        selectionPym.selectionChanged()
        
        let reportHubPym = UIAlertController(title: "Safety Shield", message: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "OY+/mMGzrjmBOrlmuWxk1oAXQZ4caRBA7Q0j+Cubyq7cS1iG4YbmqjPlvIIyck8u/B1ckw=="), preferredStyle: .actionSheet)
        reportHubPym.addAction(UIAlertAction(title: "Inappropriate Content", style: .destructive))
        reportHubPym.addAction(UIAlertAction(title: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "yEsX04/MxnnhcMk4VTnvhnNMmSev8qv8h+syfBCh0KInh1dKgKk="), style: .cancel))
        
        if let currentStagePym = self.window?.rootViewController {
            currentStagePym.present(reportHubPym, animated: true)
        }
    }
    
    
    func fencingParry(jerry:Dictionary<String,Any>){
        
        descPym.text = jerry["mobilityDrill"] as? String
        categoryBadgePym.text = jerry["mindfulMovement"] as? String
        coverPym.warmUpProtocol(weightBearing: jerry["muscleAmnesia"] as? String)
    }
    required init?(coder: NSCoder) { fatalError() }
}
