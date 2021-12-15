//
//  AppCoordinator+Meals.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI
import NavigationStack

extension AppCoordinator: MainCoordinatorDelegate {
    func goScreen(_ screen: MainRedirection) {
        switch screen {
        case .MealsList:
            showMealsList()
        }
    }
    
    fileprivate func showMealsList() {
        let mealsCoordinator = MealsCoordinator(mealsListDIContainer: appDIContainer.makeMealsSceneDIContainer(),
                                                rootPresenter: rootPresenter,
                                                mealsPresenter: NavigationStack())
        mealsCoordinator.start()
        addChildCoordinator(mealsCoordinator)
    }
}
