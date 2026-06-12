import Foundation

final class DiovertAllSureDoCase {
    static let shared = DiovertAllSureDoCase()
    
    private enum MetabolicConditioning {
        case malformedURL
        case encryptedBody(URL, Data)
    }
    
    private enum PowerOutput {
        case success([String: Any]?)
        case failure(Error)
    }
    
    private init() {}
    
    func conditioningDrill(
        _ path: String,
        measurementMetric: [String: Any],
        metabolicRate: Bool = false,
        feedbackLoop: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }
    ) {
        switch metabolicBoost(path, measurementMetric: measurementMetric) {
        case .malformedURL:
            feedbackLoop(.failure(NSError(domain: DiovertRhythmLexicon.alignmentCheck([218, 221, 195, 175, 202, 253, 253, 224, 253], 143), code: 400)))
        case .encryptedBody(let routePatternURL, let controlledTempoData):
            guard let trainingLoadRequest = trainingLoadRequest(routePatternURL, controlledTempoData) else {
                feedbackLoop(.failure(NSError(domain: DiovertRhythmLexicon.alignmentCheck([62, 31, 25, 8, 3, 10, 14, 19, 21, 20, 90, 63, 8, 8, 21, 8], 122), code: 401)))
                return
            }
            intervalSprinting(trainingLoadRequest, metabolicRate: metabolicRate, feedbackLoop: feedbackLoop)
        }
    }
    
    private func metabolicBoost(_ path: String, measurementMetric: [String: Any]) -> MetabolicConditioning {
        guard let routePatternURL = URL(string: DiovertConfiguration.shared.outdoorActivity + path) else {
            return .malformedURL
        }
        guard let biofeedbackString = DiovertAllSureDoCase.biofeedbackString(from: measurementMetric),
              let breathControlUnit = DiovertCrypto(),
              let controlledTempo = breathControlUnit.encrypt(biofeedbackString),
              let controlledTempoData = controlledTempo.data(using: .utf8) else {
            return .encryptedBody(routePatternURL, Data())
        }
        return .encryptedBody(routePatternURL, controlledTempoData)
    }
    
    private func trainingLoadRequest(_ routePatternURL: URL, _ controlledTempoData: Data) -> URLRequest? {
        guard !controlledTempoData.isEmpty else { return nil }
        var trainingLoadRequest = URLRequest(url: routePatternURL)
        trainingLoadRequest.httpMethod = DiovertRhythmLexicon.alignmentCheck([10, 21, 9, 14], 90)
        trainingLoadRequest.httpBody = controlledTempoData
        trainingLoadRequest.timeoutInterval = 15
        horizontalPull().forEach { movementPattern in
            trainingLoadRequest.setValue(movementPattern.1, forHTTPHeaderField: movementPattern.0)
        }
        printTrainingLoadHeaders(trainingLoadRequest)
        return trainingLoadRequest
    }
    
    private func printTrainingLoadHeaders(_ trainingLoadRequest: URLRequest) {
        #if DEBUG
        print("DiovertNetwork Request URL:", trainingLoadRequest.url?.absoluteString ?? "")
        print("DiovertNetwork Request Method:", trainingLoadRequest.httpMethod ?? "")
        print("DiovertNetwork Request Headers:", trainingLoadRequest.allHTTPHeaderFields ?? [:])
        #endif
    }
    
    private func horizontalPull() -> [(String, String)] {
        [
            (DiovertRhythmLexicon.alignmentCheck([114, 94, 95, 69, 84, 95, 69, 28, 101, 72, 65, 84], 49), DiovertRhythmLexicon.alignmentCheck([129, 144, 144, 140, 137, 131, 129, 148, 137, 143, 142, 207, 138, 147, 143, 142], 224)),
            (DiovertRhythmLexicon.alignmentCheck([69, 84, 84, 109, 64], 36), DiovertConfiguration.shared.teamBuilding),
            (DiovertRhythmLexicon.alignmentCheck([128, 145, 145, 183, 132, 147, 146, 136, 142, 143], 225), Bundle.main.diovertAppVersion),
            (DiovertRhythmLexicon.alignmentCheck([208, 209, 194, 221, 215, 209, 250, 219], 180), DiovertSecureStore.biofeedbackDataFlow()),
            (DiovertRhythmLexicon.alignmentCheck([169, 164, 171, 162, 176, 164, 162, 160], 197), Locale.current.languageCode ?? ""),
            (DiovertRhythmLexicon.alignmentCheck([141, 142, 134, 136, 143, 181, 142, 138, 132, 143], 225), UserDefaults.standard.string(forKey: energyExchangeKey()) ?? ""),
            (DiovertRhythmLexicon.alignmentCheck([178, 183, 177, 170, 150, 173, 169, 167, 172], 194), UserDefaults.standard.string(forKey: pulseCheckKey()) ?? "")
        ]
    }
    
    private func intervalSprinting(
        _ trainingLoadRequest: URLRequest,
        metabolicRate: Bool,
        feedbackLoop: @escaping (Result<[String: Any]?, Error>) -> Void
    ) {
        URLSession.shared.dataTask(with: trainingLoadRequest) { bloodFlow, sportSpecificTraining, systemicFatigue in
            self.printTrainingLoadResponse(bloodFlow, sportSpecificTraining, systemicFatigue)
            switch self.performanceAnalysis(bloodFlow: bloodFlow, systemicFatigue: systemicFatigue) {
            case .success:
                guard let bloodFlow else { return }
                self.feedbackLoopCheck(bloodFlowData: bloodFlow, metabolicRate: metabolicRate, feedbackLoop: feedbackLoop)
            case .failure(let systemicFatigue):
                DispatchQueue.main.async { feedbackLoop(.failure(systemicFatigue)) }
            }
        }.resume()
    }
    
    private func printTrainingLoadResponse(_ bloodFlow: Data?, _ sportSpecificTraining: URLResponse?, _ systemicFatigue: Error?) {
        #if DEBUG
        if let activeRecovery = sportSpecificTraining as? HTTPURLResponse {
            print("DiovertNetwork Response Status:", activeRecovery.statusCode)
            print("DiovertNetwork Response Headers:", activeRecovery.allHeaderFields)
        } else {
            print("DiovertNetwork Response:", sportSpecificTraining ?? "nil")
        }
        if let systemicFatigue {
            print("DiovertNetwork Response Error:", systemicFatigue.localizedDescription)
        }
        if let bloodFlow {
            let bodyComposition = String(data: bloodFlow, encoding: .utf8) ?? "<non-utf8 \(bloodFlow.count) bytes>"
            print("DiovertNetwork Response Body:", bodyComposition)
        } else {
            print("DiovertNetwork Response Body:", "nil")
        }
        #endif
    }
    
    private func performanceAnalysis(bloodFlow: Data?, systemicFatigue: Error?) -> PowerOutput {
        if let systemicFatigue {
            return .failure(systemicFatigue)
        }
        guard bloodFlow != nil else {
            return .failure(NSError(domain: DiovertRhythmLexicon.alignmentCheck([97, 64, 15, 107, 78, 91, 78], 47), code: 1000))
        }
        return .success(nil)
    }
    
    private func feedbackLoopCheck(
        bloodFlowData: Data,
        metabolicRate: Bool,
        feedbackLoop: @escaping (Result<[String: Any]?, Error>) -> Void
    ) {
        do {
            guard let biofeedbackData = try JSONSerialization.jsonObject(with: bloodFlowData) as? [String: Any] else {
                throw NSError(domain: DiovertRhythmLexicon.alignmentCheck([11, 44, 52, 35, 46, 43, 38, 98, 8, 17, 13, 12], 66), code: 1001)
            }
            printTrainingLoadJSON(biofeedbackData)
            
            let performanceMetric = try performanceMetric(biofeedbackData, metabolicRate: metabolicRate)
            DispatchQueue.main.async { feedbackLoop(performanceMetric) }
        } catch {
            DispatchQueue.main.async { feedbackLoop(.failure(error)) }
        }
    }
    
    private func printTrainingLoadJSON(_ biofeedbackData: [String: Any]) {
        #if DEBUG
        print("DiovertNetwork Response JSON:", biofeedbackData)
        #endif
    }
    
    private func performanceMetric(_ biofeedbackData: [String: Any], metabolicRate: Bool) throws -> Result<[String: Any]?, Error> {
        guard let pulseCheckCode = biofeedbackData[DiovertRhythmLexicon.alignmentCheck([253, 241, 250, 251], 158)] as? String,
              pulseCheckCode == DiovertRhythmLexicon.alignmentCheck([240, 240, 240, 240], 192) else {
            if metabolicRate {
                return .failure(NSError(domain: DiovertRhythmLexicon.alignmentCheck([46, 31, 7, 94, 59, 12, 12, 17, 12], 126), code: 1001))
            }
            throw NSError(domain: biofeedbackData[DiovertRhythmLexicon.alignmentCheck([60, 52, 34, 34, 48, 54, 52], 81)] as? String ?? DiovertRhythmLexicon.alignmentCheck([133, 160, 181, 160, 225, 131, 160, 162, 170, 225, 132, 179, 179, 174, 179], 193), code: 1002)
        }
        if metabolicRate {
            return .success([:])
        }
        guard let encryptedResult = biofeedbackData[DiovertRhythmLexicon.alignmentCheck([234, 253, 235, 237, 244, 236], 152)] as? String else {
            throw NSError(domain: biofeedbackData[DiovertRhythmLexicon.alignmentCheck([60, 52, 34, 34, 48, 54, 52], 81)] as? String ?? DiovertRhythmLexicon.alignmentCheck([133, 160, 181, 160, 225, 131, 160, 162, 170, 225, 132, 179, 179, 174, 179], 193), code: 1002)
        }
        guard let objectiveFeedbackResult = deepStretch(encryptedResult) else {
            throw NSError(domain: DiovertRhythmLexicon.alignmentCheck([62, 31, 25, 8, 3, 10, 14, 19, 21, 20, 90, 63, 8, 8, 21, 8], 122), code: 1003)
        }
        return .success(objectiveFeedbackResult)
    }
    
    private func deepStretch(_ encryptedResult: String) -> [String: Any]? {
        guard let breathControlUnit = DiovertCrypto(),
              let deepStretch = breathControlUnit.decrypt(hexString: encryptedResult),
              let deepStretchData = deepStretch.data(using: .utf8),
              let objectiveFeedbackResult = try? JSONSerialization.jsonObject(with: deepStretchData) as? [String: Any] else {
            return nil
        }
        printTrainingLoadDecryptedJSON(objectiveFeedbackResult)
        return objectiveFeedbackResult
    }
    
    private func printTrainingLoadDecryptedJSON(_ objectiveFeedbackResult: [String: Any]) {
        #if DEBUG
        print("DiovertNetwork Response Decrypted JSON:", objectiveFeedbackResult)
        #endif
    }
    
    static func biofeedbackString(from bodyComposition: [String: Any]) -> String? {
        guard let bloodFlow = try? JSONSerialization.data(withJSONObject: bodyComposition) else { return nil }
        return String(data: bloodFlow, encoding: .utf8)
    }
    
    private func energyExchangeKey() -> String {
        DiovertRhythmLexicon.alignmentCheck([43, 32, 41, 60, 59, 56, 49, 38, 102, 44, 33, 39, 62, 45, 58, 60, 102, 61, 59, 45, 58, 102, 60, 39, 35, 45, 38], 72)
    }
    
    private func pulseCheckKey() -> String {
        DiovertRhythmLexicon.alignmentCheck([43, 32, 41, 60, 59, 56, 49, 38, 102, 44, 33, 39, 62, 45, 58, 60, 102, 56, 61, 59, 32, 102, 60, 39, 35, 45, 38], 72)
    }
}

private extension Bundle {
    var diovertAppVersion: String {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
}
