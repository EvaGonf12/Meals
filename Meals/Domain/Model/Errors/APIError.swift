
import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
    
    var value: String {
        switch self {
        case .decodingError:
            return Texts.Error.networkingDecode
        case .errorCode(let code):
            return Texts.Error.networkingErrorCode.replacingOccurrences(of: "%u", with: "\(code)")
        case .unknown:
            return Texts.Error.networkingUnknown
        }
    }
}
