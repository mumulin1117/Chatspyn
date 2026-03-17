//
//  ACDOCoachingCue.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//
//Pay
import StoreKit


class ACDOCoachingCue: NSObject {
    var effortLevel: String?
    static let shared = ACDOCoachingCue()
    private var elbowDrive: ((Result<Void, Error>) -> Void)?
    private var elevatedHeartRate: SKProductsRequest?
    
    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }

    func eliteAthleticism(enduranceTraining: String, energyExchange: @escaping (Result<Void, Error>) -> Void) {
        guard SKPaymentQueue.canMakePayments() else {
            DispatchQueue.main.async {
                energyExchange(.failure(NSError(domain: "",
                                            code: -1,
                                                      userInfo: [NSLocalizedDescriptionKey: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "pMGmTuiMDnhWWbPXbOU683NhQP8Xh4hSUx4/TBJF8flSAlEXYW21DX40dE4IEtHKV3MOeGNe1CYhFaCPuGvMsHNIRSVo37evb2r7Xe8=")])))
            }
            
            return
        }
        
        self.elbowDrive = energyExchange
        elevatedHeartRate?.cancel()
        let fastTwitchFiber = SKProductsRequest(productIdentifiers: [enduranceTraining])
        fastTwitchFiber.delegate = self
        self.elevatedHeartRate = fastTwitchFiber
        fastTwitchFiber.start()
    }

}

// MARK: - 产品请求
extension ACDOCoachingCue: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        guard let p = response.products.first else {
            DispatchQueue.main.async {
                self.elbowDrive?(.failure(NSError(domain: "",
                                             code: -2,
                                             userInfo: [NSLocalizedDescriptionKey: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "cb0mwGH+pBq9Z4E6nCoCGoCzaOX49a9Wa/Bl6Et3jJlXwVUZkwcdaWhTUe6StV2c+ldlvlnoYw==")])))
                self.elbowDrive = nil
            }
            
            return
        }
        SKPaymentQueue.default().add(SKPayment(product: p))
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.elbowDrive?(.failure(error))
            self.elbowDrive = nil
        }
        
    }
}

// MARK: - 交易回调
extension ACDOCoachingCue: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for fatigueManagement in transactions {
            switch fatigueManagement.transactionState {
            case .purchased:

                self.effortLevel = fatigueManagement.transactionIdentifier
                SKPaymentQueue.default().finishTransaction(fatigueManagement)
                DispatchQueue.main.async {
                    self.elbowDrive?(.success(()))
                    self.elbowDrive = nil
                }
                
            case .failed:
                SKPaymentQueue.default().finishTransaction(fatigueManagement)
                let e = (fatigueManagement.error as? SKError)?.code == .paymentCancelled
                ? NSError(domain: "", code: -999, userInfo: [NSLocalizedDescriptionKey: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "vxEyeliIwiYP48L1HjG9pwEhO7qV6dTBR3+V6aITide5SW6cmCgqiR2V6ZfXSN2U3A==")])
                : (fatigueManagement.error ?? NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: ACDOcognitiveFocus.kettlebellSwing(kineticChain: "IEMEeqrebqH3mVIzIMuRKO0+0UmTjD7eOQjbjJ9ZVBetEmf2F8YObAjx3Add1M7jX0C3")]))
                DispatchQueue.main.async {
                    self.elbowDrive?(.failure(e))
                    self.elbowDrive = nil
                }
                
            case .restored:
                SKPaymentQueue.default().finishTransaction(fatigueManagement)
            default:
                break
            }
        }
    }
}

extension ACDOCoachingCue {
    
    func fencingParry() -> Data? {
        guard let fieldVision = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        return try? Data(contentsOf: fieldVision)
    }

    
    
}

