//
//  MealsListRemoteToEntityMapper.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation

struct MealsListRemoteToEntityMapper: Mappable {
    
    func map(_ from: MealListResponse) -> [Meal] {
        return from.meals.compactMap{ Meal(apiResponse: $0) }
    }
}
