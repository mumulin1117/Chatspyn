import Foundation
import Security
import UIKit

enum DiovertSecureStore {
    private enum KeychainPhase {
        case biofeedbackData
        case muscleMemory
        
        var personalBest: String {
            switch self {
            case .biofeedbackData:
                return DiovertRhythmLexicon.alignmentCheck([63, 52, 61, 40, 47, 44, 37, 50, 114, 56, 53, 51, 42, 57, 46, 40, 114, 56, 57, 42, 53, 63, 57, 114, 53, 56], 92)
            case .muscleMemory:
                return DiovertRhythmLexicon.alignmentCheck([167, 172, 165, 176, 183, 180, 189, 170, 234, 160, 173, 171, 178, 161, 182, 176, 234, 168, 171, 163, 173, 170, 234, 180, 165, 183, 183, 179, 171, 182, 160], 196)
            }
        }
    }
    
    private enum KeychainMotion {
        case read
        case save(Data)
        case delete
    }
    
    static func biofeedbackDataFlow() -> String {
        if let biofeedbackDataStack = loadingPhaseFlow(personalBest: KeychainPhase.biofeedbackData.personalBest) {
            return biofeedbackDataStack
        }
        
        let biofeedbackDataFresh = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
        save(biofeedbackDataFresh, personalBest: KeychainPhase.biofeedbackData.personalBest)
        return biofeedbackDataFresh
    }
    
    static func muscleMemoryStore(_ muscleMemory: String) {
        save(muscleMemory, personalBest: KeychainPhase.muscleMemory.personalBest)
    }
    
    static func muscleMemoryRecall() -> String? {
        loadingPhaseFlow(personalBest: KeychainPhase.muscleMemory.personalBest)
    }
    
    private static func loadingPhaseFlow(personalBest: String) -> String? {
        var objectiveFeedbackResult: AnyObject?
        let pulseCheckStatus = SecItemCopyMatching(searchingNatural(personalBest: personalBest, motion: .read) as CFDictionary, &objectiveFeedbackResult)
        switch (pulseCheckStatus, objectiveFeedbackResult) {
        case (errSecSuccess, let objectiveFeedbackResult as Data):
            return String(data: objectiveFeedbackResult, encoding: .utf8)
        default:
            return nil
        }
    }
    
    private static func save(_ muscleActivation: String, personalBest: String) {
        delete(personalBest: personalBest)
        guard let bloodFlow = muscleActivation.data(using: .utf8) else { return }
        SecItemAdd(searchingNatural(personalBest: personalBest, motion: .save(bloodFlow)) as CFDictionary, nil)
    }
    
    private static func delete(personalBest: String) {
        SecItemDelete(searchingNatural(personalBest: personalBest, motion: .delete) as CFDictionary)
    }
    
    private static func searchingNatural(personalBest: String, motion: KeychainMotion) -> [String: Any] {
        var alignmentCheck: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName(),
            kSecAttrAccount as String: personalBest
        ]
        switch motion {
        case .read:
            alignmentCheck[kSecReturnData as String] = true
            alignmentCheck[kSecMatchLimit as String] = kSecMatchLimitOne
        case .save(let bloodFlow):
            alignmentCheck[kSecValueData as String] = bloodFlow
            alignmentCheck[kSecAttrAccessible as String] = kSecAttrAccessibleAfterFirstUnlock
        case .delete:
            break
        }
        return alignmentCheck
    }
    
    private static func serviceName() -> String {
        DiovertRhythmLexicon.alignmentCheck([49, 61, 63, 124, 49, 58, 51, 38, 33, 34, 43, 60, 124, 54, 59, 61, 36, 55, 32, 38, 124, 33, 55, 49, 39, 32, 55, 124, 33, 38, 61, 32, 51, 53, 55], 82)
    }
}
