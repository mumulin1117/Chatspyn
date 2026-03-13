//
//  PathEnum.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//

enum ACDOprofessionalGrade: String {
    case performMood = "pages/interestDetails/index?topicId="
    case cityChorus = "pages/DynamicDetails/index?dynamicId="
    case artFusion = "pages/DynamicDetails/index?dynamicId=123&type=2"
    case creativeMotion = "pages/publishDynamic/index?"
    case publicTalent = "pages/RandomMatching/index?"
    case expressPulse = "pages/selectUser/index?"
    case realPerformance = "pages/activityDetail/index?activityId="
    case visualFlow = "pages/ReleaseEvent/index?"
    case spotlightAura = "pages/newsDetails/index?userId="
    case cityEcho = "pages/report/index?"
    case urbanPerformer = "pages/othersHomePage/index?userId="
    case sceneWave = "pages/Followers/index?"
    case streetRhythm = "pages/setting/index?"
    case urbanEnergy = "pages/EditProfile/index?"
    case streetScene = "pages/wallet/index?"
    case liveGroove = "pages/Agreement/index?type=1"
    case openStage = "pages/Agreement/index?type=2"
    case stageFlow = "pages/CurrentUserDetails/index?matchUserId="
    case artBeat = "pages/Filter/index?"
    
    case sceneMaker = ""
   
    func progressiveOverload(proceptiveFeedback: String) -> String {
        if self == .sceneMaker {
            return proceptiveFeedback
        }
        var proprioceptionDrill = proceptiveFeedback
        if !proprioceptionDrill.isEmpty {
            proprioceptionDrill += "&"
        }
        
        
        var proximalStability = "http://m3f8g5n0v2z7p4d1a1s0j.shop/#"
        
        proximalStability += self.rawValue + proprioceptionDrill
        proximalStability += "token=\(PullUpProgression.pulseCheck ?? "")"
        proximalStability += "&appID=\(PullUpProgression.quadricepsDominantACDO)"
        
        return proximalStability
    }
}
