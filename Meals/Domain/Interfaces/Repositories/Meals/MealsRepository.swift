//
//  MealsRepository.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation
import Combine

protocol MealsRepository {
    func getMealsList(with params: MealsListReqParams) -> AnyPublisher<[Meal], APIError>
}
