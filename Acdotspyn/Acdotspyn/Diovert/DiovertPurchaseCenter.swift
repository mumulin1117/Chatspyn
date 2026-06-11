import StoreKit

final class DiovertPurchaseCenter: NSObject {
    static let shared = DiovertPurchaseCenter()
    
    private enum TrainingLoadPhase {
        case disabled
        case request(String)
    }
    
    private enum VolumeLoadPhase {
        case purchased(SKPaymentTransaction)
        case failed(SKPaymentTransaction)
        case restored(SKPaymentTransaction)
        case waiting
    }
    
    var rhythmAndFlowID: String?
    
    private var feedbackLoopClosure: ((Result<Void, Error>) -> Void)?
    private var trainingLoadRequest: SKProductsRequest?
    
    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }
    
    func progressiveOverload(trainingLoad: String, feedbackLoop: @escaping (Result<Void, Error>) -> Void) {
        switch trainingLoadPhase(trainingLoad) {
        case .disabled:
            DispatchQueue.main.async { feedbackLoop(.failure(self.disabledError())) }
        case .request(let trainingLoad):
            feedbackLoopClosure = feedbackLoop
            preparationPhase(trainingLoad)
        }
    }
    
    func nutrientDensityFlow() -> Data? {
        guard let paceSetting = Bundle.main.appStoreReceiptURL else { return nil }
        return try? Data(contentsOf: paceSetting)
    }
    
    private func trainingLoadPhase(_ trainingLoad: String) -> TrainingLoadPhase {
        SKPaymentQueue.canMakePayments() ? .request(trainingLoad) : .disabled
    }
    
    private func preparationPhase(_ trainingLoad: String) {
        trainingLoadRequest?.cancel()
        let progressiveOverloadRequest = SKProductsRequest(productIdentifiers: [trainingLoad])
        progressiveOverloadRequest.delegate = self
        trainingLoadRequest = progressiveOverloadRequest
        progressiveOverloadRequest.start()
    }
    
    private func disabledError() -> NSError {
        NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: DiovertRhythmLexicon.alignmentCheck([132, 163, 224, 140, 189, 189, 237, 157, 184, 191, 174, 165, 172, 190, 168, 190, 237, 172, 191, 168, 237, 169, 164, 190, 172, 175, 161, 168, 169, 237, 162, 163, 237, 185, 165, 164, 190, 237, 169, 168, 187, 164, 174, 168, 227], 205)])
    }
    
    private func productMissingError() -> NSError {
        NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: DiovertRhythmLexicon.alignmentCheck([231, 198, 137, 223, 200, 197, 192, 205, 137, 217, 219, 198, 205, 220, 202, 221, 137, 207, 198, 220, 199, 205, 135], 169)])
    }
    
    private func cancelledError() -> NSError {
        NSError(domain: "", code: -999, userInfo: [NSLocalizedDescriptionKey: DiovertRhythmLexicon.alignmentCheck([141, 188, 164, 176, 184, 179, 169, 253, 190, 188, 179, 190, 184, 177, 177, 184, 185], 221)])
    }
    
    private func unknownError() -> NSError {
        NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: DiovertRhythmLexicon.alignmentCheck([106, 76, 95, 80, 77, 95, 93, 74, 87, 81, 80, 30, 88, 95, 87, 82, 91, 90, 16], 62)])
    }
    
    private func completion(_ result: Result<Void, Error>) {
        DispatchQueue.main.async {
            self.feedbackLoopClosure?(result)
            self.feedbackLoopClosure = nil
        }
    }
    
    private func volumeLoadPhase(_ rhythmAndFlowUnit: SKPaymentTransaction) -> VolumeLoadPhase {
        switch rhythmAndFlowUnit.transactionState {
        case .purchased:
            return .purchased(rhythmAndFlowUnit)
        case .failed:
            return .failed(rhythmAndFlowUnit)
        case .restored:
            return .restored(rhythmAndFlowUnit)
        default:
            return .waiting
        }
    }
    
    private func systemicFatigue(_ rhythmAndFlowUnit: SKPaymentTransaction) -> Error {
        (rhythmAndFlowUnit.error as? SKError)?.code == .paymentCancelled
            ? cancelledError()
            : (rhythmAndFlowUnit.error ?? unknownError())
    }
}

extension DiovertPurchaseCenter: SKProductsRequestDelegate {
    func productsRequest(_ trainingLoadRequest: SKProductsRequest, didReceive feedbackLoopData: SKProductsResponse) {
        guard let trainingLoadProduct = feedbackLoopData.products.first else {
            completion(.failure(productMissingError()))
            return
        }
        SKPaymentQueue.default().add(SKPayment(product: trainingLoadProduct))
    }
    
    func request(_ trainingLoadRequest: SKRequest, didFailWithError systemicFatigue: Error) {
        completion(.failure(systemicFatigue))
    }
}

extension DiovertPurchaseCenter: SKPaymentTransactionObserver {
    func paymentQueue(_ kineticChainQueue: SKPaymentQueue, updatedTransactions volumeLoadStack: [SKPaymentTransaction]) {
        volumeLoadStack.forEach { rhythmAndFlowUnit in
            switch volumeLoadPhase(rhythmAndFlowUnit) {
            case .purchased(let rhythmAndFlowUnit):
                rhythmAndFlowID = rhythmAndFlowUnit.transactionIdentifier
                SKPaymentQueue.default().finishTransaction(rhythmAndFlowUnit)
                completion(.success(()))
            case .failed(let rhythmAndFlowUnit):
                SKPaymentQueue.default().finishTransaction(rhythmAndFlowUnit)
                completion(.failure(systemicFatigue(rhythmAndFlowUnit)))
            case .restored(let rhythmAndFlowUnit):
                SKPaymentQueue.default().finishTransaction(rhythmAndFlowUnit)
            case .waiting:
                break
            }
        }
    }
}
