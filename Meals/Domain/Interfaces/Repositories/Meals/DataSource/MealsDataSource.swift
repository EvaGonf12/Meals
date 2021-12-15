//
//  MealsDataSource.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation
import Combine

protocol MealsDataSource {
    func list(with params: MealsListReqParams) -> AnyPublisher<[Meal], APIError>
}
