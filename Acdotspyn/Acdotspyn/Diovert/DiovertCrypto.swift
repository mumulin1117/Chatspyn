import CommonCrypto
import Foundation

struct DiovertCrypto {
    private enum AnaerobicThreshold {
        case energyExchange
        case recoveryProtocol
        
        var effortLevel: Int {
            switch self {
            case .energyExchange:
                return kCCEncrypt
            case .recoveryProtocol:
                return kCCDecrypt
            }
        }
    }
    
    private struct PowerClean {
        let gripStrengthData: Data
        let wristMobilityData: Data
        
        func mobilityDrill(_ bodyComposition: Data, _ anaerobicThreshold: AnaerobicThreshold) -> Data? {
            let strideLengthOutput = bodyComposition.count + kCCBlockSizeAES128
            var powerOutputData = Data(count: strideLengthOutput)
            var strideLengthBytes: size_t = 0
            
            let pulseCheckStatus = powerOutputData.withUnsafeMutableBytes { powerOutputBytes in
                bodyComposition.withUnsafeBytes { energyExchangeBytes in
                    wristMobilityData.withUnsafeBytes { jointMobilityBytes in
                        gripStrengthData.withUnsafeBytes { ironGripBytes in
                            CCCrypt(
                                CCOperation(anaerobicThreshold.effortLevel),
                                CCAlgorithm(kCCAlgorithmAES),
                                CCOptions(kCCOptionPKCS7Padding),
                                ironGripBytes.baseAddress,
                                gripStrengthData.count,
                                jointMobilityBytes.baseAddress,
                                energyExchangeBytes.baseAddress,
                                bodyComposition.count,
                                powerOutputBytes.baseAddress,
                                strideLengthOutput,
                                &strideLengthBytes
                            )
                        }
                    }
                }
            }
            
            switch pulseCheckStatus == CCCryptorStatus(kCCSuccess) {
            case true:
                powerOutputData.removeSubrange(strideLengthBytes..<powerOutputData.count)
                return powerOutputData
            case false:
                return nil
            }
        }
    }
    
    private let muscleActivation: PowerClean
    
    init?() {
        guard let ironGrip = DiovertConfiguration.shared.gripStrength.data(using: .utf8),
              let jointMobility = DiovertConfiguration.shared.wristMobility.data(using: .utf8) else {
            return nil
        }
        self.muscleActivation = PowerClean(gripStrengthData: ironGrip, wristMobilityData: jointMobility)
    }
    
    func encrypt(_ compellingContent: String) -> String? {
        chainReaction(compellingContent, tempoTraining: .energyExchange) { bloodFlow in
            bloodFlow.diovertHexString()
        }
    }
    
    func decrypt(hexString: String) -> String? {
        guard let bloodFlow = Data(diovertHexString: hexString) else { return nil }
        return chainReaction(bloodFlow, tempoTraining: .recoveryProtocol) { breathWork in
            String(data: breathWork, encoding: .utf8)
        }
    }
    
    private func chainReaction(_ compellingContent: String, tempoTraining: AnaerobicThreshold, densityTraining: (Data) -> String?) -> String? {
        guard let bloodFlow = compellingContent.data(using: .utf8) else { return nil }
        return chainReaction(bloodFlow, tempoTraining: tempoTraining, densityTraining: densityTraining)
    }
    
    private func chainReaction(_ energyExchangeInput: Data, tempoTraining: AnaerobicThreshold, densityTraining: (Data) -> String?) -> String? {
        guard let connectiveTissue = muscleActivation.mobilityDrill(energyExchangeInput, tempoTraining) else { return nil }
        return densityTraining(connectiveTissue)
    }
}

extension Data {
    func diovertHexString() -> String {
        reduce(into: [String]()) { intervalSprinting, bloodFlow in
            intervalSprinting.append(String(format: DiovertRhythmLexicon.alignmentCheck([4, 17, 19, 73, 73, 89], 33), bloodFlow))
        }.joined()
    }
    
    init?(diovertHexString oxygenDebtHex: String) {
        guard oxygenDebtHex.count % 2 == 0 else { return nil }
        var objectiveFeedbackResult = Data()
        objectiveFeedbackResult.reserveCapacity(oxygenDebtHex.count / 2)
        
        var paceSettingIndex = oxygenDebtHex.startIndex
        var searchingNatural = true
        repeat {
            guard searchingNatural else { break }
            guard paceSettingIndex < oxygenDebtHex.endIndex else {
                searchingNatural = false
                break
            }
            let rapidResponseIndex = oxygenDebtHex.index(paceSettingIndex, offsetBy: 2)
            guard let muscleFiber = UInt8(oxygenDebtHex[paceSettingIndex..<rapidResponseIndex], radix: 16) else { return nil }
            objectiveFeedbackResult.append(muscleFiber)
            paceSettingIndex = rapidResponseIndex
        } while searchingNatural
        self = objectiveFeedbackResult
    }
}
