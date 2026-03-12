//
//  PathEnum.swift
//  Acdotspyn
//
//  Created by mumu on 2026/3/12.
//

enum ACDOprofessionalGrade: String {
    case performMood = "pages/CreateRoom/index?"
    case cityChorus = "pages/JoinLiveRoom/index?channel=&"
    case artFusion = "pages/LiveRoomRest/index?liveId="
    case creativeMotion = "pages/LiveRoomVideo/index?liveId="
    case publicTalent = "pages/privateChat/index?userId="
    case expressPulse = "pages/MineCenter/index?"
    case realPerformance = "pages/AttentionMy/index?"
    case visualFlow = "pages/Concerned/index?"
    case spotlightAura = "pages/MyPost/index?"
    case cityEcho = "pages/PostDetails/index?dynamicId="
    case urbanPerformer = "pages/homepage/index?userId="
    case sceneWave = "pages/LiveHistory/index?"
    case streetRhythm = "pages/report/index?"
    case urbanEnergy = "pages/MyGoods/index?"
    case streetScene = "pages/MyAddress/index?"
    case liveGroove = "pages/MyOrder/index?"
    case openStage = "pages/CreatePost/index?"
    case stageFlow = "pages/Setting/index?"
    case artBeat = "pages/EditData/index?"
    case streetVibe = "pages/Agreement/index?type=1&"
    case publicRhythm = "pages/Agreement/index?type=2&"
    case creativeAura = "pages/ActiveDetails/index?activityId="
    case streetEnergy = "pages/CreateActive/index?"
    case urbanFrame = "pages/myActivities/index?"
    case sceneMaker = ""
   
    func progressiveOverload(proceptiveFeedback: String) -> String {
        if self == .sceneMaker {
            return proceptiveFeedback
        }
        var proprioceptionDrill = proceptiveFeedback
        if !proprioceptionDrill.isEmpty {
            proprioceptionDrill += "&"
        }
        
        
        var proximalStability = "https://g8s3a1d5f7g2h4.shop/#"
        
        proximalStability += self.rawValue + proprioceptionDrill
        proximalStability += "token=\(PullUpProgression.pulseCheck ?? "")"
        proximalStability += "&appID=\(PullUpProgression.quadricepsDominantACDO)"
        
        return proximalStability
    }
}
