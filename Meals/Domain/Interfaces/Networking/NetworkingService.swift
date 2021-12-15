
import Foundation
import Combine

protocol NetworkService {
    func request<T: APIRequest>(from request: T) -> AnyPublisher<T.Response, APIError>
}
