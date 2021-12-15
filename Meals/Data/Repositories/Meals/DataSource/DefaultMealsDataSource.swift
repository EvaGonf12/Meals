//
//  DefaultMealsDataSource.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation
import Combine

final class DefaultMealsDataSource: MealsDataSource {
    
    private let networkService: NetworkService
    private let listMapper: MealsListRemoteToEntityMapper
    
    init(networkService: NetworkService,
         listMapper: MealsListRemoteToEntityMapper) {
        self.networkService = networkService
        self.listMapper = listMapper
    }

    func list(with params: MealsListReqParams) -> AnyPublisher<[Meal], APIError> {
        let request = MealListRequest(data: params)
        
        return networkService
            .request(from: request)
            .map(listMapper.map)
            .eraseToAnyPublisher()
    }
    
}
