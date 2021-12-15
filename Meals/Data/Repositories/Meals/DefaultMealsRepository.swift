//
//  DefaultMealsRepository.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation
import Combine

final class DefaultMealsRepository: MealsRepository {
    
    let remoteDataSource: MealsDataSource
    
    init(remoteDataSource: MealsDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getMealsList(with params: MealsListReqParams) -> AnyPublisher<[Meal], APIError> {
        return remoteDataSource.list(with: params)
    }
}
