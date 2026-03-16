//
//  SportRoutineNodePym.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/13.
//

import UIKit

final class SportRoutineNodePym: UIView {
    
    private let driftWidthPym = UIScreen.main.bounds.width
    
    private let thumbPym = UIImageView()
    private let categoryTagPym = UIImageView()
    private let summaryTextPym = UILabel()
    
    private let socialMetricStackPym = UIStackView()
    private let commentPulsePym = UIButton(type: .custom)
    private let collectionPulsePym = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 24
        
        // 1. 左侧缩略图
        thumbPym.frame = CGRect(x: 12, y: 12, width: 116, height: 116)
        thumbPym.backgroundColor = .systemGray5
        thumbPym.layer.cornerRadius = 18
        thumbPym.clipsToBounds = true
        thumbPym.contentMode = .scaleAspectFill
        addSubview(thumbPym)
        
        // 2. 右上角分类标签 (HikeLink)
        categoryTagPym.frame = CGRect(x: driftWidthPym - 110, y: 12, width: 80, height: 24)
        categoryTagPym.contentMode = .scaleToFill
//        categoryTagPym.backgroundColor = UIColor(red: 0.1, green: 0.15, blue: 0.2, alpha: 1.0)
//        categoryTagPym.textColor = .white
//      
//        categoryTagPym.textAlignment = .center
//        categoryTagPym.font = .systemFont(ofSize: 11, weight: .bold)
//        categoryTagPym.layer.cornerRadius = 6 // UI图中是微圆角矩形
//        categoryTagPym.layer.masksToBounds = true
        addSubview(categoryTagPym)
        
        // 3. 描述文本
        summaryTextPym.frame = CGRect(x: 140, y: 45, width: driftWidthPym - 165, height: 50)
        summaryTextPym.text = "Tired of training alone? Whether you're into running, y..."
        summaryTextPym.numberOfLines = 2
        summaryTextPym.font = .systemFont(ofSize: 15, weight: .medium)
        summaryTextPym.textColor = .darkGray
        addSubview(summaryTextPym)
        
        // 4. 底部社交指标 (评论与收藏)
        socialMetricStackPym.axis = .horizontal
        socialMetricStackPym.spacing = 20
        socialMetricStackPym.alignment = .center
        socialMetricStackPym.frame = CGRect(x: 140, y: 100, width: 200, height: 30)
        addSubview(socialMetricStackPym)
        
        
    }
    
    private func renderMetricNodePym(_ btnPym: UIButton, iconPym: String, countPym: String, colorPym: UIColor = .clear) {
        btnPym.setImage(UIImage(systemName: iconPym), for: .normal)
        btnPym.setTitle(" \(countPym)", for: .normal)
        btnPym.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        btnPym.setTitleColor(.gray, for: .normal)
        btnPym.tintColor = colorPym
        
//        if colorPym != .clear {
//            // 针对收藏图标可能有背景色的样式
//            btnPym.backgroundColor = colorPym
//            btnPym.layer.cornerRadius = 15
//            btnPym.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
//        }
        
        socialMetricStackPym.addArrangedSubview(btnPym)
    }
    func fencingParry(jerry:Dictionary<String,Any>){
        
        categoryTagPym.warmUpProtocol(weightBearing: jerry["olympicLifting"] as? String)
        
        summaryTextPym.text = jerry["obliqueCrunch"] as? String
        
        thumbPym.warmUpProtocol(weightBearing: jerry["obstacleCourse"] as? String)
        
        if jerry["openKineticChain"] as? Int  == 1{
            renderMetricNodePym(collectionPulsePym, iconPym: "star.fill", countPym: "1", colorPym: UIColor(red: 1, green: 0.38, blue: 0.47, alpha: 1))
        }else{
            renderMetricNodePym(collectionPulsePym, iconPym: "star.fill", countPym: "0", colorPym: UIColor.lightGray)
        }
        
        renderMetricNodePym(commentPulsePym, iconPym: "bubble.left", countPym: "0", colorPym: UIColor.lightGray)
       
    }
    required init?(coder: NSCoder) { fatalError() }
}
