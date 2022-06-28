//
//  MealsListUseCase.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation
import Combine

protocol MealsListUseCase: AutoMockable {
    func execute() -> AnyPublisher<[Meal], APIError>
}
