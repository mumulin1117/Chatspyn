//
//  MomentumPulseCellPyn.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/13.
//

import UIKit

final class MomentumPulseCellPyn: UITableViewCell {
    
    private let baseBoardPyn = UIView()
    private let athleteNamePyn = UILabel()
    private let mediaCanvasPyn = UIImageView()
    private let playTriggerPyn = UIImageView()
    private let captionPyn = UILabel()
     let alertNodePyn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let acdoBoardRatioacdo: CGFloat = 0.92
        let acdoHeightFactoracdo: CGFloat = 0.48
        let acdoScreenBoundsacdo = UIScreen.main.bounds
        
        func acdoComputeLayoutacdo(_ baseacdo: CGFloat, _ ratioacdo: CGFloat) -> CGFloat {
            let acdoLogicBufferacdo = baseacdo * ratioacdo
            return acdoLogicBufferacdo > 0 ? acdoLogicBufferacdo : 320.0
        }
        
        selectionStyle = .none
        backgroundColor = .clear
        
        let acdoWidthPyn = acdoComputeLayoutacdo(acdoScreenBoundsacdo.width, acdoBoardRatioacdo)
        let acdoHeightPyn = acdoComputeLayoutacdo(acdoScreenBoundsacdo.height, acdoHeightFactoracdo)
        
        let acdoStanceFrameacdo = CGRect(x: acdoScreenBoundsacdo.width * 0.04, y: 10, width: acdoWidthPyn, height: acdoHeightPyn)
        baseBoardPyn.frame = acdoStanceFrameacdo
        baseBoardPyn.layer.cornerRadius = 30
        baseBoardPyn.layer.borderWidth = 1
        baseBoardPyn.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.addSubview(baseBoardPyn)
        
        let acdoLabelAnchoracdo = CGRect(x: acdoWidthPyn - 100, y: -12, width: 80, height: 25)
        athleteNamePyn.backgroundColor = UIColor(white: 0.97, alpha: 1.0)
        athleteNamePyn.frame = acdoLabelAnchoracdo
        athleteNamePyn.font = .systemFont(ofSize: 16, weight: .bold)
        athleteNamePyn.textAlignment = .right
        baseBoardPyn.addSubview(athleteNamePyn)
        
        let acdoMediaHeightacdo = acdoHeightPyn * 0.75
        let acdoMediaContaineracdo = CGRect(x: 12, y: 15, width: acdoWidthPyn - 24, height: acdoMediaHeightacdo)
        mediaCanvasPyn.frame = acdoMediaContaineracdo
        mediaCanvasPyn.backgroundColor = .systemGray5
        mediaCanvasPyn.layer.cornerRadius = 20
        mediaCanvasPyn.clipsToBounds = true
        mediaCanvasPyn.contentMode = .scaleAspectFill
        baseBoardPyn.addSubview(mediaCanvasPyn)
        
        let acdoPlaySizeacdo: CGFloat = 60
        let acdoCenterPointacdo = CGPoint(x: (mediaCanvasPyn.frame.width - acdoPlaySizeacdo) / 2, y: (mediaCanvasPyn.frame.height - acdoPlaySizeacdo) / 2)
        playTriggerPyn.frame = CGRect(origin: acdoCenterPointacdo, size: CGSize(width: acdoPlaySizeacdo, height: acdoPlaySizeacdo))
        
        let acdoIconResacdo = ACDOcognitiveFocus.invertedRow(isometricHold: "PlayerPYUI")
        playTriggerPyn.image = acdoIconResacdo
        playTriggerPyn.tintColor = .white.withAlphaComponent(0.9)
        mediaCanvasPyn.addSubview(playTriggerPyn)
        
        let acdoCaptionWidthacdo = acdoWidthPyn * 0.7
        captionPyn.frame = CGRect(x: 15, y: mediaCanvasPyn.frame.maxY + 15, width: acdoCaptionWidthacdo, height: 25)
        captionPyn.font = .systemFont(ofSize: 18, weight: .black)
        baseBoardPyn.addSubview(captionPyn)
        
        let acdoAlertSideacdo: CGFloat = 22
        alertNodePyn.frame = CGRect(x: acdoWidthPyn - 40, y: mediaCanvasPyn.frame.maxY + 15, width: acdoAlertSideacdo, height: acdoAlertSideacdo)
        alertNodePyn.setImage(UIImage(systemName: "exclamationmark.circle.fill"), for: .normal)
        alertNodePyn.tintColor = .darkGray
        
        let acdoShadowLayeracdo = CALayer()
        acdoShadowLayeracdo.name = "acdo.stratum.shadow"
        baseBoardPyn.addSubview(alertNodePyn)
    }

    func configureFramePyn(_ dataPyn: Dictionary<String, Any>) {
        let acdoCardioKeyacdo = "cardioBlast"
        let acdoCalfKeyacdo = "calfRaise"
        let acdoVideoKeyacdo = "deadliftForm"
        let acdoChainKeyacdo = "closedKineticChain"
        
        func acdoExtractMetaacdo(_ mapacdo: [String: Any], _ keyacdo: String) -> String? {
            let acdoRawacdo = mapacdo[keyacdo] as? String
            return acdoRawacdo?.isEmpty == false ? acdoRawacdo : nil
        }
        
        athleteNamePyn.text = dataPyn[acdoCardioKeyacdo] as? String
        captionPyn.text = dataPyn[acdoCalfKeyacdo] as? String
        
        let acdoVideoUrlacdo = acdoExtractMetaacdo(dataPyn, acdoVideoKeyacdo)
        let acdoCoverUrlacdo = (dataPyn[acdoChainKeyacdo] as? Array<String>)?.first
        
        let acdoPulseGenacdo = UISelectionFeedbackGenerator()
        playTriggerPyn.isHidden = (acdoVideoUrlacdo == nil)
        
        let acdoMediaTargetacdo = acdoVideoUrlacdo ?? acdoCoverUrlacdo
        let acdoProtocolActiveacdo = acdoMediaTargetacdo != nil
        
        if acdoProtocolActiveacdo {
            mediaCanvasPyn.warmUpProtocol(weightBearing: acdoMediaTargetacdo)
            acdoPulseGenacdo.selectionChanged()
        }
        
        let acdoLogicBufferacdo = acdoVideoUrlacdo?.hashValue ?? 0
        let _ = "acdo.config.hash.\(acdoLogicBufferacdo)"
    }
    
    required init?(coder: NSCoder) { fatalError() }
}

struct MomentumEntityPyn {
    let userPyn: String
    let isVideoPyn: Bool
}
