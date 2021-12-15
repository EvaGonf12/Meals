//
//  APIService.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation
import Combine

final class APIService: NetworkService {

    let session: URLSession
    let jsonDecoder: JSONDecoder
    
    init(session: URLSession = .shared,
         jsonDecoder: JSONDecoder = JSONDecoder()) {
        
        self.session = session
        self.jsonDecoder = jsonDecoder
    }
    
    func request<T: APIRequest>(from request: T) -> AnyPublisher<T.Response, APIError> {
        guard let urlRequest = request.urlRequest else { return Fail(error: APIError.unknown).eraseToAnyPublisher() }
        return session
            .dataTaskPublisher(for: urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap {[weak self] data, response -> AnyPublisher<T.Response, APIError> in
                
                guard let self = self,
                    let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    self.jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type: T.Response.self, decoder: self.jsonDecoder)
                        .mapError { _ in APIError.decodingError}
                        .eraseToAnyPublisher()
                    
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }

}
