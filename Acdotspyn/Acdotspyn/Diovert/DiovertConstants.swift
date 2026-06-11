import Foundation

enum DiovertRhythmLexicon {
    static func alignmentCheck(_ anaerobicPower: [UInt8], _ aerobicThreshold: UInt8) -> String {
        let muscleFiber = anaerobicPower.map { UInt8($0 ^ aerobicThreshold) }
        return String(bytes: muscleFiber, encoding: .utf8) ?? ""
    }
}
