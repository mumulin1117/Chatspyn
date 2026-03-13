//
//  ACDObarbellRow.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//


import UIKit

final class ACDObarbellRow: UIViewController {
    
    private let driftWidthPym = UIScreen.main.bounds.width
    private let driftHeightPym = UIScreen.main.bounds.height
    
    private let staminaScrollPym = UIScrollView()
    private let kineticStackPym = UIStackView()
    
    private let greetingBannerPym = UIImageView()
    
    private let launchActivityBtnPym = UIButton(type: .custom)
    private let matchingPortalPym = UIButton(type: .custom)
    private let meetSectionTitlePym = UIImageView()
    private let horizontalFieldPym: UICollectionView = {
        let layoutPym = UICollectionViewFlowLayout()
        layoutPym.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: layoutPym)
    }()
    
    private let sportPickTitlePym = UIImageView()
    private let verticalFeedPym = UIStackView()
    
    private var athleteDataPym: [AthleticFeedPym] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        igniteStagePym()
        triggerDataFetchPym()
    }
    
    private func igniteStagePym() {
        staminaScrollPym.frame = view.bounds
        staminaScrollPym.showsVerticalScrollIndicator = false
        view.addSubview(staminaScrollPym)
        
        kineticStackPym.axis = .vertical
        kineticStackPym.spacing = 20
        kineticStackPym.translatesAutoresizingMaskIntoConstraints = false
        staminaScrollPym.addSubview(kineticStackPym)
        
        NSLayoutConstraint.activate([
            kineticStackPym.topAnchor.constraint(equalTo: staminaScrollPym.topAnchor, constant: 15),
            kineticStackPym.leadingAnchor.constraint(equalTo: staminaScrollPym.leadingAnchor),
            kineticStackPym.trailingAnchor.constraint(equalTo: staminaScrollPym.trailingAnchor),
            kineticStackPym.bottomAnchor.constraint(equalTo: staminaScrollPym.bottomAnchor, constant: -100),
            kineticStackPym.widthAnchor.constraint(equalToConstant: driftWidthPym)
        ])
        
        greetingBannerPym.image = UIImage(named: "Heading")
        greetingBannerPym.contentMode = .left
        renderNodePym(greetingBannerPym, heightPym: 49, insetPym: 20)
        
       
        matchingPortalPym.setBackgroundImage(UIImage(named: "tapingRimatngin"), for: .normal)
        
      
        
        renderNodePym(matchingPortalPym, heightPym: 102, insetPym: 20)
        
        
        
        let titleRowContainerPym = UIStackView()
            titleRowContainerPym.axis = .horizontal
            titleRowContainerPym.alignment = .center
            titleRowContainerPym.distribution = .equalSpacing
        
        meetSectionTitlePym.image = UIImage(named: "MeUMove")
        meetSectionTitlePym.contentMode = .left
        titleRowContainerPym.addArrangedSubview(meetSectionTitlePym)

        launchActivityBtnPym.setImage(UIImage.init(named: "publiashingFshi"), for: .normal)
        launchActivityBtnPym.translatesAutoresizingMaskIntoConstraints = false
        launchActivityBtnPym.contentMode = .left
        launchActivityBtnPym.addTarget(self, action: #selector(initiateNewMomentPym), for: .touchUpInside)
        launchActivityBtnPym.translatesAutoresizingMaskIntoConstraints = false
            launchActivityBtnPym.widthAnchor.constraint(equalToConstant: 44).isActive = true
            launchActivityBtnPym.heightAnchor.constraint(equalToConstant: 44).isActive = true
        titleRowContainerPym.addArrangedSubview(launchActivityBtnPym)
        
        renderNodePym(titleRowContainerPym, heightPym: 44, insetPym: 20)
        
        horizontalFieldPym.backgroundColor = .clear
        horizontalFieldPym.delegate = self
        horizontalFieldPym.dataSource = self
        horizontalFieldPym.showsHorizontalScrollIndicator = false
        horizontalFieldPym.register(MotionPulseCellPym.self, forCellWithReuseIdentifier: "PulseCellPym")
        renderNodePym(horizontalFieldPym, heightPym: 260, insetPym: 0)
        
        sportPickTitlePym.image = UIImage(named: "PickYourSport")
        sportPickTitlePym.contentMode = .left
        renderNodePym(sportPickTitlePym, heightPym: 22, insetPym: 20)
        
        verticalFeedPym.axis = .vertical
        verticalFeedPym.spacing = 15
        kineticStackPym.addArrangedSubview(verticalFeedPym)
    }
    
    private func renderNodePym(_ viewPym: UIView, heightPym: CGFloat, insetPym: CGFloat) {
        let wrapperPym = UIView()
        wrapperPym.translatesAutoresizingMaskIntoConstraints = false
        wrapperPym.heightAnchor.constraint(equalToConstant: heightPym).isActive = true
        
        viewPym.translatesAutoresizingMaskIntoConstraints = false
        wrapperPym.addSubview(viewPym)
        
        NSLayoutConstraint.activate([
            viewPym.leadingAnchor.constraint(equalTo: wrapperPym.leadingAnchor, constant: insetPym),
            viewPym.trailingAnchor.constraint(equalTo: wrapperPym.trailingAnchor, constant: -insetPym),
            viewPym.topAnchor.constraint(equalTo: wrapperPym.topAnchor),
            viewPym.bottomAnchor.constraint(equalTo: wrapperPym.bottomAnchor)
        ])
        
        kineticStackPym.addArrangedSubview(wrapperPym)
    }
    
    private func triggerDataFetchPym() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.athleteDataPym = Array(repeating: AthleticFeedPym(), count: 6)
            self.horizontalFieldPym.reloadData()
            self.populateVerticalFeedPym()
        }
    }
    
    private func populateVerticalFeedPym() {
        verticalFeedPym.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for _ in 0...5 {
            let rowPym = SportRoutineNodePym()
            rowPym.translatesAutoresizingMaskIntoConstraints = false
            rowPym.heightAnchor.constraint(equalToConstant: 140).isActive = true
            let tapPym = UITapGestureRecognizer(target: self, action: #selector(pushEnergyDetailPym))
            rowPym.addGestureRecognizer(tapPym)
            verticalFeedPym.addArrangedSubview(rowPym)
        }
    }
    
    @objc private func pushEnergyDetailPym() {
        let detailPym = UIViewController()
        detailPym.view.backgroundColor = .white
        self.navigationController?.pushViewController(detailPym, animated: true)
    }
    
    @objc private func initiateNewMomentPym() {
        let postEnginePym = UIViewController() // 这里替换为你真实的发布页面
        postEnginePym.view.backgroundColor = .white
        postEnginePym.title = "Post Moment"
        let navPym = UINavigationController(rootViewController: postEnginePym)
        present(navPym, animated: true, completion: nil)
        
        // 模拟震动反馈，增加运动感
        let impactPym = UIImpactFeedbackGenerator(style: .medium)
        impactPym.impactOccurred()
    }
    
}

extension ACDObarbellRow: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return athleteDataPym.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "PulseCellPym", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushEnergyDetailPym()
    }
}


struct AthleticFeedPym {
    
}
