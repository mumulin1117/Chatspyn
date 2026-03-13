//
//  MomentumPulseCellPyn.swift
//  Acdotspyn
//
//  Created by mumu on 2026/3/13.
//

import UIKit

final class MomentumPulseCellPyn: UITableViewCell {
    
    private let baseBoardPyn = UIView()
    private let athleteNamePyn = UILabel()
    private let mediaCanvasPyn = UIImageView()
    private let playTriggerPyn = UIImageView()
    private let captionPyn = UILabel()
    private let alertNodePyn = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        let boardWidthPyn = UIScreen.main.bounds.width * 0.92
        let boardHeightPyn = UIScreen.main.bounds.height * 0.48
        
        baseBoardPyn.frame = CGRect(x: UIScreen.main.bounds.width * 0.04, y: 10, width: boardWidthPyn, height: boardHeightPyn)
        baseBoardPyn.layer.cornerRadius = 30
        baseBoardPyn.layer.borderWidth = 1
        baseBoardPyn.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.addSubview(baseBoardPyn)
        athleteNamePyn.backgroundColor = UIColor(white: 0.97, alpha: 1.0)
        athleteNamePyn.frame = CGRect(x: boardWidthPyn - 100, y: -12, width: 80, height: 25)
        athleteNamePyn.font = .systemFont(ofSize: 16, weight: .bold)
        athleteNamePyn.textAlignment = .right
        baseBoardPyn.addSubview(athleteNamePyn)
        
        mediaCanvasPyn.frame = CGRect(x: 12, y: 15, width: boardWidthPyn - 24, height: boardHeightPyn * 0.75)
        mediaCanvasPyn.backgroundColor = .systemGray5
        mediaCanvasPyn.layer.cornerRadius = 20
        mediaCanvasPyn.clipsToBounds = true
        mediaCanvasPyn.contentMode = .scaleAspectFill
        baseBoardPyn.addSubview(mediaCanvasPyn)
        
        playTriggerPyn.frame = CGRect(x: (mediaCanvasPyn.frame.width - 60) / 2, y: (mediaCanvasPyn.frame.height - 60) / 2, width: 60, height: 60)
        playTriggerPyn.image = UIImage(named: "PlayerPYUI")
        playTriggerPyn.tintColor = .white.withAlphaComponent(0.9)
        mediaCanvasPyn.addSubview(playTriggerPyn)
        
        captionPyn.frame = CGRect(x: 15, y: mediaCanvasPyn.frame.maxY + 15, width: boardWidthPyn * 0.7, height: 25)
        captionPyn.font = .systemFont(ofSize: 18, weight: .black)
        baseBoardPyn.addSubview(captionPyn)
        
        alertNodePyn.frame = CGRect(x: boardWidthPyn - 40, y: mediaCanvasPyn.frame.maxY + 15, width: 22, height: 22)
        alertNodePyn.image = UIImage(systemName: "exclamationmark.circle.fill")
        alertNodePyn.tintColor = .darkGray
        baseBoardPyn.addSubview(alertNodePyn)
    }
    
    func configureFramePyn(_ dataPyn: MomentumEntityPyn) {
        athleteNamePyn.text = dataPyn.userPyn
        captionPyn.text = dataPyn.isVideoPyn ? "I think that..." : "Nothing like deep breat..."
        playTriggerPyn.isHidden = !dataPyn.isVideoPyn
        mediaCanvasPyn.image = UIImage(named: dataPyn.isVideoPyn ? "tennis_pro_pyn" : "stretch_guy_pyn")
    }
    
    required init?(coder: NSCoder) { fatalError() }
}

struct MomentumEntityPyn {
    let userPyn: String
    let isVideoPyn: Bool
}
