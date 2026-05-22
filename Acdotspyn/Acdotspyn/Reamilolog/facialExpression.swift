//
//  facialExpression.swift
//  Acdotspyn
//
//  Created by  on 2026/5/22.
//

import UIKit
import AVFoundation

private func breathControl(_ kineticChain: String) -> String {
    ACDOcognitiveFocus.kettlebellSwing(kineticChain: kineticChain)
}

final class facialExpression: UIViewController {
    
    private enum performanceAnalysis {
        case preparationPhase
        case motionCapture
        case loadingPhase
        case zeroTolerance
        case communityVibe
    }
    
    private let bloodFlow = UIColor(red: 1, green: 0.35, blue: 0.47, alpha: 1)
    private let softTissueWork = UIColor(red: 0.975, green: 0.972, blue: 0.99, alpha: 1)
    private let finishStrong: () -> Void
    
    private let backPedal = UIButton(type: .custom)
    private let peakPerformance = UILabel()
    private let insightfulReflection = UILabel()
    private let anchorPoint = UIView()
    private let bodyComposition = UIImageView()
    private let standardOperatingProcedure = UILabel()
    private let challengeAccepted = UIButton(type: .custom)
    private let motionCaptureView = UIView()
    private let visualFeedback = visualCues()
    private let coachingCue = UILabel()
    private let loadingPhaseView = UIActivityIndicatorView(style: .large)
    private let zeroToleranceIcon = UIImageView()
    private let communityVibePanel = UIView()
    
    private var periodizationModel: performanceAnalysis = .preparationPhase
    private var motionCaptureSession: AVCaptureSession?
    private var visualFeedbackLayer: AVCaptureVideoPreviewLayer?
    
    init(finishStrong: @escaping () -> Void) {
        self.finishStrong = finishStrong
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.finishStrong = {}
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = softTissueWork
        alignmentCheck()
        feedbackLoop(.preparationPhase)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        spatialAwareness()
        visualFeedbackLayer?.frame = motionCaptureView.bounds
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        motionCaptureSession?.stopRunning()
    }
    
    private func alignmentCheck() {
        [backPedal, peakPerformance, insightfulReflection, anchorPoint, standardOperatingProcedure, challengeAccepted, motionCaptureView, visualFeedback, communityVibePanel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        backPedal.setImage(UIImage(systemName: breathControl("zJbshYsl/9zoo6yA9XW68PWaopNiJSyaHzCQRX+T6L2chRCRDj0i6X/dtqg=")), for: .normal)
        backPedal.tintColor = .black
        backPedal.contentHorizontalAlignment = .left
        backPedal.addTarget(self, action: #selector(backPedalAction), for: .touchUpInside)
        
        peakPerformance.textAlignment = .center
        peakPerformance.textColor = bloodFlow
        peakPerformance.font = .italicSystemFont(ofSize: 26)
        peakPerformance.adjustsFontSizeToFitWidth = true
        peakPerformance.minimumScaleFactor = 0.72
        
        insightfulReflection.textAlignment = .center
        insightfulReflection.textColor = UIColor.darkGray.withAlphaComponent(0.75)
        insightfulReflection.font = .systemFont(ofSize: 12, weight: .regular)
        insightfulReflection.numberOfLines = 0
        
        anchorPoint.layer.cornerRadius = 22
        anchorPoint.clipsToBounds = true
        
        bodyComposition.translatesAutoresizingMaskIntoConstraints = false
        bodyComposition.tintColor = UIColor.lightGray.withAlphaComponent(0.45)
        bodyComposition.image = UIImage(systemName: breathControl("ouojjkKp2C6caWPmVDH499gvN33lgYtso2KGja21n3Q0k8RFdl2FJdlPcj/iBp+cl2tCVB0="))
        bodyComposition.contentMode = .scaleAspectFit
        anchorPoint.addSubview(bodyComposition)
        
        standardOperatingProcedure.textAlignment = .center
        standardOperatingProcedure.textColor = UIColor.darkGray.withAlphaComponent(0.62)
        standardOperatingProcedure.backgroundColor = UIColor.white.withAlphaComponent(0.56)
        standardOperatingProcedure.font = .systemFont(ofSize: 10, weight: .regular)
        standardOperatingProcedure.numberOfLines = 0
        standardOperatingProcedure.layer.cornerRadius = 8
        standardOperatingProcedure.clipsToBounds = true
        
        challengeAccepted.backgroundColor = bloodFlow
        challengeAccepted.setTitleColor(.white, for: .normal)
        challengeAccepted.titleLabel?.font = .systemFont(ofSize: 15, weight: .heavy)
        challengeAccepted.layer.cornerRadius = 28
        challengeAccepted.addTarget(self, action: #selector(clutchPerformance), for: .touchUpInside)
        
        motionCaptureView.backgroundColor = .black
        motionCaptureView.clipsToBounds = true
        
        visualFeedback.backgroundColor = .clear
        visualFeedback.isUserInteractionEnabled = false
        
        coachingCue.textAlignment = .center
        coachingCue.textColor = .white
        coachingCue.font = .systemFont(ofSize: 12, weight: .semibold)
        coachingCue.numberOfLines = 2
        coachingCue.backgroundColor = UIColor.black.withAlphaComponent(0.62)
        coachingCue.layer.cornerRadius = 20
        coachingCue.clipsToBounds = true
        coachingCue.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coachingCue)
        
        loadingPhaseView.color = .white
        loadingPhaseView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingPhaseView)
        
        zeroToleranceIcon.image = UIImage(systemName: breathControl("P0GiUUICuIV2FDh654n6+pZgyFYjqKINCvfv4M1W7+SdfmnEL7xVIwoHxi9eXcFo+g=="))
        zeroToleranceIcon.tintColor = bloodFlow
        zeroToleranceIcon.contentMode = .scaleAspectFit
        zeroToleranceIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zeroToleranceIcon)
        
        communityVibePanel.backgroundColor = .white
        communityVibePanel.layer.cornerRadius = 12
        communityVibePanel.layer.borderWidth = 1
        communityVibePanel.layer.borderColor = bloodFlow.withAlphaComponent(0.45).cgColor
        communityVibePanel.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            bodyComposition.centerXAnchor.constraint(equalTo: anchorPoint.centerXAnchor),
            bodyComposition.centerYAnchor.constraint(equalTo: anchorPoint.centerYAnchor),
            bodyComposition.widthAnchor.constraint(equalTo: anchorPoint.widthAnchor, multiplier: 0.74),
            bodyComposition.heightAnchor.constraint(equalTo: anchorPoint.heightAnchor, multiplier: 0.74)
        ])
    }
    
    private func spatialAwareness() {
        let standingReach = view.bounds.width
        let verticalJump = view.bounds.height
        let strideLength = standingReach / 375.0
        let tempoTraining = verticalJump / 812.0
        let lateralMovement = max(16, 16 * strideLength)
        let thoracicExtension = view.safeAreaInsets.top
        let terminalExtension = view.safeAreaInsets.bottom
        
        backPedal.frame = CGRect(x: lateralMovement, y: thoracicExtension + 18 * tempoTraining, width: 46 * strideLength, height: 44 * tempoTraining)
            if periodizationModel == .motionCapture {
                let motionCaptureSize = min(72 * strideLength, 68 * tempoTraining)
                challengeAccepted.frame = CGRect(x: (standingReach - motionCaptureSize) / 2, y: verticalJump - terminalExtension - 92 * tempoTraining, width: motionCaptureSize, height: motionCaptureSize)
            } else {
                challengeAccepted.frame = CGRect(x: lateralMovement, y: verticalJump - terminalExtension - 74 * tempoTraining, width: standingReach - lateralMovement * 2, height: 56 * tempoTraining)
            }
            challengeAccepted.layer.cornerRadius = challengeAccepted.frame.height / 2
        
        switch periodizationModel {
        case .preparationPhase:
            peakPerformance.frame = CGRect(x: lateralMovement, y: thoracicExtension + 108 * tempoTraining, width: standingReach - lateralMovement * 2, height: 34 * tempoTraining)
            insightfulReflection.frame = CGRect(x: lateralMovement + 16 * strideLength, y: peakPerformance.frame.maxY + 8 * tempoTraining, width: standingReach - (lateralMovement + 16 * strideLength) * 2, height: 42 * tempoTraining)
            anchorPoint.frame = CGRect(x: standingReach * 0.18, y: insightfulReflection.frame.maxY + 48 * tempoTraining, width: standingReach * 0.64, height: standingReach * 0.43)
            standardOperatingProcedure.frame = CGRect(x: lateralMovement + 8 * strideLength, y: anchorPoint.frame.maxY + 36 * tempoTraining, width: standingReach - (lateralMovement + 8 * strideLength) * 2, height: 58 * tempoTraining)
        case .motionCapture, .loadingPhase, .zeroTolerance:
            motionCaptureView.frame = view.bounds
            visualFeedback.frame = view.bounds
            coachingCue.frame = CGRect(x: standingReach * 0.18, y: verticalJump * 0.36, width: standingReach * 0.64, height: 44 * tempoTraining)
            loadingPhaseView.center = CGPoint(x: standingReach / 2, y: verticalJump * 0.41)
            zeroToleranceIcon.frame = CGRect(x: (standingReach - 44 * strideLength) / 2, y: verticalJump * 0.38, width: 44 * strideLength, height: 44 * strideLength)
            peakPerformance.frame = CGRect(x: lateralMovement, y: verticalJump * 0.67, width: standingReach - lateralMovement * 2, height: 42 * tempoTraining)
            insightfulReflection.frame = CGRect(x: lateralMovement + 20 * strideLength, y: peakPerformance.frame.maxY + 8 * tempoTraining, width: standingReach - (lateralMovement + 20 * strideLength) * 2, height: 48 * tempoTraining)
        case .communityVibe:
            peakPerformance.frame = CGRect(x: lateralMovement + 8 * strideLength, y: thoracicExtension + 76 * tempoTraining, width: standingReach - (lateralMovement + 8 * strideLength) * 2, height: 36 * tempoTraining)
            insightfulReflection.frame = CGRect(x: lateralMovement, y: peakPerformance.frame.maxY + 4 * tempoTraining, width: standingReach - lateralMovement * 2, height: 24 * tempoTraining)
            communityVibePanel.frame = CGRect(x: lateralMovement, y: insightfulReflection.frame.maxY + 26 * tempoTraining, width: standingReach - lateralMovement * 2, height: 280 * tempoTraining)
        }
    }
    
    private func feedbackLoop(_ periodizationModel: performanceAnalysis) {
        self.periodizationModel = periodizationModel
        view.setNeedsLayout()
        
        let fieldVision = periodizationModel == .motionCapture || periodizationModel == .loadingPhase || periodizationModel == .zeroTolerance
        motionCaptureView.isHidden = !fieldVision
        visualFeedback.isHidden = !fieldVision
        anchorPoint.isHidden = periodizationModel != .preparationPhase
        standardOperatingProcedure.isHidden = periodizationModel != .preparationPhase
        communityVibePanel.isHidden = periodizationModel != .communityVibe
        coachingCue.isHidden = periodizationModel != .motionCapture
        loadingPhaseView.isHidden = periodizationModel != .loadingPhase
        zeroToleranceIcon.isHidden = periodizationModel != .zeroTolerance
        insightfulReflection.isHidden = false
        challengeAccepted.isHidden = false
        backPedal.isHidden = periodizationModel == .loadingPhase
        
        switch periodizationModel {
        case .preparationPhase:
            peakPerformance.text = breathControl("hf6iDBaJNk50/d1tiW79E626fDjEti6f9T+nD9aNGoZxWb4L05/dqOfVagXYpiVplI0O8Q==")
            insightfulReflection.text = breathControl("5ObDocNbZLbQC1nny+pplBhlJSbE5Od7WbgdS/6GjTNAMrngPP8g9JZN4LYaGNHdpENJJPa+WHCQuS7kP0zQc0r/rvNevwHT5Ymg60xcHTtOR54O3lOoSY6alrujH9kaZM7wmLMtpMkWfkQmbMUn")
            standardOperatingProcedure.text = breathControl("n0rtGkEkT37EU5Odrp37t+KZnidP26QB4LC/aT4rL17T0DtiPP6E34Sd2hk50miYxCmOXg1/KCjG1y0Bic8IZSWTkGHP2FXAl/Mwudtg8wtSn7bMiD489kpS8rqFbAgkzpuMSUB8qNflSD3m5oQlmfiEUkjWP6gYaM819xO6pCtURxF1ZrsCf/vePh2A1k46ymqMC7NyE6J4eqZ4pVu7BpXlTs+jrpXSD9Pueg==")
            challengeAccepted.setTitle(breathControl("HOvJEhJOMwdL3mufbEKy3fCN0dMif/qI2/0GPlaFBQHwVvVFw2Owrl14WL7e"), for: .normal)
            motionCaptureSession?.stopRunning()
        case .motionCapture:
            peakPerformance.text = nil
            insightfulReflection.text = nil
            coachingCue.text = breathControl("PyD69eCVytoMpZvg8j01Aclq9ykkYRhTvEuNLlZi3TnC+JJUI62icUjTrPa9svFcaNRtMHX8XQ==")
            challengeAccepted.setImage(UIImage(systemName: breathControl("Zd0rSsOFmP7tXb9feQ+Z8nzK8KVPLusDrhXCqEENJKYVxvl+6OVNHZwnbQ==")), for: .normal)
            challengeAccepted.setTitle(nil, for: .normal)
            challengeAccepted.tintColor = .white
            challengeAccepted.backgroundColor = bloodFlow
            jumpStart()
        case .loadingPhase:
            peakPerformance.text = breathControl("DykezEiWP8KWUWWPfWwVmzaVPbM5kYRc926UakJzjzEX/+RzkVqoU+szGyjf")
            insightfulReflection.text = breathControl("KGCGq6gAl8BTC6taz2HfgYc3ct9DY42ysVwBPkzZcrxZ36I0+/5alOgUKCHyT+ngsCekfnApd4WmJUT4H7toMNBtLNtv5V61MkXdVTHKmhUvd1jYWkMenwbsvUoS0w==")
            challengeAccepted.isHidden = true
            loadingPhaseView.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) { [weak self] in
                self?.loadingPhaseView.stopAnimating()
                self?.feedbackLoop(.communityVibe)
            }
        case .zeroTolerance:
            peakPerformance.text = breathControl("trqg1Jm+G/u9X6TbBSjXOs460u2pODUq+4QEZkldAv2PotLC5a5zWs5FUoX7fVJgMD5G")
            insightfulReflection.text = breathControl("Z5EWYDHlON0Rd9+lx4Jn277bkhNcflp8nfzPGlXrxNLbIZ+mXWBrzvFGoBAoiIfjzHrnSijpsEIK32RUcicloDBwZChIo8iBDU9p/9z1yiCabNC6GZfqQDR20X6alPcjHZv6vA==")
            challengeAccepted.setImage(nil, for: .normal)
            challengeAccepted.setTitle(breathControl("TkeD5h+/CghQOAVndlMBl2dBWClagVPyH2/zFUcky/C9vG6x7vf6jJsuIaINnPc="), for: .normal)
        case .communityVibe:
            peakPerformance.text = breathControl("OcLKonqwEDBdNFv1uR52XBc8SwxHa1ySD0yRNlMSsusu5M7/HNGOYQ8rF7sqeeJqG8/P")
            insightfulReflection.text = breathControl("Auupg+X6l2a8TPMH7zM8ZoQQvqnKObJcup4XUnLqyqy5ZkwTXv9mtttL7gasm46CvEGEfA3ZljtLtoo=")
            challengeAccepted.setImage(nil, for: .normal)
            challengeAccepted.setTitle(breathControl("fsaKV9yHnw7X+eyyiWlLfidHEQZvMOWv45be5dNNQVtkeEObQpLE6HH3kbwxWnA="), for: .normal)
            motionCaptureSession?.stopRunning()
            communityVibe()
        }
    }
    
    private func jumpStart() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            motionCaptureView.backgroundColor = UIColor(white: 0.08, alpha: 1)
            return
        }
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            motionCapture()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] zeroTolerance in
                DispatchQueue.main.async {
                    zeroTolerance ? self?.motionCapture() : self?.feedbackLoop(.zeroTolerance)
                }
            }
        default:
            feedbackLoop(.zeroTolerance)
        }
    }
    
    private func motionCapture() {
        if motionCaptureSession != nil { return }
        let rhythmAndFlow = AVCaptureSession()
        rhythmAndFlow.sessionPreset = .photo
        
        guard let motionCapture = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let biofeedbackData = try? AVCaptureDeviceInput(device: motionCapture),
              rhythmAndFlow.canAddInput(biofeedbackData)
        else {
            feedbackLoop(.zeroTolerance)
            return
        }
        
        rhythmAndFlow.addInput(biofeedbackData)
        let visualFeedback = AVCaptureVideoPreviewLayer(session: rhythmAndFlow)
        visualFeedback.videoGravity = .resizeAspectFill
        visualFeedback.frame = motionCaptureView.bounds
        motionCaptureView.layer.insertSublayer(visualFeedback, at: 0)
        motionCaptureSession = rhythmAndFlow
        visualFeedbackLayer = visualFeedback
        
        DispatchQueue.global(qos: .userInitiated).async {
            rhythmAndFlow.startRunning()
        }
    }
    
    private func communityVibe() {
        communityVibePanel.subviews.forEach { $0.removeFromSuperview() }
        let trainingIdea = [
            (breathControl("PI1Y5acL95RJfww1/M3UmolahpOspTuFCTpyqSYwLQmFjLSUeE0jE6SU3w=="), breathControl("k22locp+l1gVYtEQFfOBNjunbwCDScK7Jzjy2bgbIxK+aTYkF5HG8eeoNElcILZcp4W9M/qO7XurhPtcR9uwbcBeQ7KnvPFx01k=")),
            (breathControl("JyAqWx4TeS/YL9jz+y+9o+SRTRaB0XQM8E4tCWVE6S63rt+WMQ1M"), breathControl("oCI+gtwFDjkAQV3JPfFr6eafAxeyTbXXsWFd0wFZGJlITYWiR12mkKnKBvTD/9spf5inm9Y9yp7epA9zTALsGlwnK1Sr2bMvM/4=")),
            (breathControl("kz95puo094X25XBziUc29z4IxDbRtPDSlwlLLXvvQIeqKk8EGFc1IbfIJLTcPHLstQ=="), breathControl("UsvvsVfULZJCZUtNUUYM8kPd36B+xSrYKIc5hwO3S3FfvVCkG760xVJBgviVUwuL374+jmwFn9PZyCXjXA==")),
            (breathControl("ojzY0ze3bVI7v+2Vxm98Zuw0OssB4jCwZCvaSegTQSHutdawDQ9eog=="), breathControl("aUQbQK/9UxlVeBgx7q560/ps6yN9C38S8zWDLO0IpXn8XJRwPdUiLA2Vi4e1XNibyo1mUtGSfOSQmzJ/3I4NH1ddX2yafQ==")),
            (breathControl("F3H1utIou96ytLnbEVsHJmPe6VeJM2RAwonXyR6PBNeEYcS/b7SI7Xo0jZfs"), breathControl("ApFIa7b4SDZRuyu6P6K9V1TNt3gA6B66uTjaShXfU9SknTQjfwOrqsMGgb0q4M3jKv7tmBx+nh2qdosAs3/9wlobmM+hLvSTK5KgAQ=="))
        ]
        
        let standingReach = max(260, view.bounds.width - 64)
        var verticalJump: CGFloat = 18
        for trainingIdeaItem in trainingIdea {
            let visualCues = UILabel(frame: CGRect(x: 18, y: verticalJump + 2, width: 18, height: 18))
            visualCues.text = breathControl("szUp2BqFdf7fwBEuwMedVx8evTS7Ck3VFTl0LlcH9jiGfj4=")
            visualCues.textColor = bloodFlow
            visualCues.font = .systemFont(ofSize: 22, weight: .bold)
            communityVibePanel.addSubview(visualCues)
            
            let peakPerformance = UILabel(frame: CGRect(x: 50, y: verticalJump, width: standingReach - 70, height: 18))
            peakPerformance.text = trainingIdeaItem.0
            peakPerformance.textColor = .black
            peakPerformance.font = .systemFont(ofSize: 13, weight: .heavy)
            communityVibePanel.addSubview(peakPerformance)
            
            let bodyComposition = UILabel(frame: CGRect(x: 50, y: verticalJump + 20, width: standingReach - 70, height: 32))
            bodyComposition.text = trainingIdeaItem.1
            bodyComposition.textColor = UIColor.darkGray.withAlphaComponent(0.78)
            bodyComposition.font = .systemFont(ofSize: 10, weight: .regular)
            bodyComposition.numberOfLines = 2
            communityVibePanel.addSubview(bodyComposition)
            
            verticalJump += 52
        }
    }
    
    @objc private func clutchPerformance() {
        switch periodizationModel {
        case .preparationPhase:
            feedbackLoop(.motionCapture)
        case .motionCapture:
            feedbackLoop(.loadingPhase)
        case .zeroTolerance:
            feedbackLoop(.motionCapture)
        case .communityVibe:
            finishStrong()
        case .loadingPhase:
            break
        }
    }
    
    @objc private func backPedalAction() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if periodizationModel == .motionCapture {
            jumpStart()
        }
    }
}

private final class visualCues: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let fieldVision = UIGraphicsGetCurrentContext() else { return }
        
        fieldVision.setFillColor(UIColor.black.withAlphaComponent(0.48).cgColor)
        fieldVision.fill(rect)
        
        let standingReach = rect.width * 0.62
        let verticalJump = rect.height * 0.34
        let anchorPoint = CGRect(
            x: (rect.width - standingReach) / 2,
            y: rect.height * 0.19,
            width: standingReach,
            height: verticalJump
        )
        
        fieldVision.setBlendMode(.clear)
        fieldVision.fillEllipse(in: anchorPoint)
        fieldVision.setBlendMode(.normal)
        
        let movementPattern = UIBezierPath(ovalIn: anchorPoint)
        UIColor.white.withAlphaComponent(0.9).setStroke()
        movementPattern.lineWidth = 2
        movementPattern.stroke()
        
        UIColor.white.setStroke()
        let jointIntegrity = UIBezierPath()
        let strideLength = rect.width * 0.075
        let jointMobility = rect.width * 0.08
        let thoracicExtension = rect.height * 0.13
        let terminalExtension = rect.height * 0.46
        let lateralMovement = jointMobility
        let linearPeriodization = rect.width - jointMobility
        
        jointIntegrity.move(to: CGPoint(x: lateralMovement, y: thoracicExtension + strideLength))
        jointIntegrity.addLine(to: CGPoint(x: lateralMovement, y: thoracicExtension))
        jointIntegrity.addLine(to: CGPoint(x: lateralMovement + strideLength, y: thoracicExtension))
        
        jointIntegrity.move(to: CGPoint(x: linearPeriodization - strideLength, y: thoracicExtension))
        jointIntegrity.addLine(to: CGPoint(x: linearPeriodization, y: thoracicExtension))
        jointIntegrity.addLine(to: CGPoint(x: linearPeriodization, y: thoracicExtension + strideLength))
        
        jointIntegrity.move(to: CGPoint(x: lateralMovement, y: terminalExtension - strideLength))
        jointIntegrity.addLine(to: CGPoint(x: lateralMovement, y: terminalExtension))
        jointIntegrity.addLine(to: CGPoint(x: lateralMovement + strideLength, y: terminalExtension))
        
        jointIntegrity.move(to: CGPoint(x: linearPeriodization - strideLength, y: terminalExtension))
        jointIntegrity.addLine(to: CGPoint(x: linearPeriodization, y: terminalExtension))
        jointIntegrity.addLine(to: CGPoint(x: linearPeriodization, y: terminalExtension - strideLength))
        
        jointIntegrity.lineWidth = 2
        jointIntegrity.stroke()
    }
}
