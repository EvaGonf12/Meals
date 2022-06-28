//
//  AppDIContainer+Meals.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation

extension AppDIContainer {
    func makeMealsSceneDIContainer() -> MealsListSceneDIContainer {
        return MealsListSceneDIContainer(networkService: networkService)
    }
}
