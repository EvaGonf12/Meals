//
//  MealsCoordinator.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation
import NavigationStack
import SwiftUI

final class MealsCoordinator: Coordinator {
    
    let mealsListDIContainer: MealsListSceneDIContainer
    let rootPresenter: NavigationStack
    let mealsPresenter: NavigationStack
    
    init(mealsListDIContainer: MealsListSceneDIContainer,
         rootPresenter: NavigationStack,
         mealsPresenter: NavigationStack) {
        
        self.mealsListDIContainer = mealsListDIContainer
        self.rootPresenter = rootPresenter
        self.mealsPresenter = mealsPresenter
    }
    
    override func start() {
        let mealsListViewModel = MealsListViewModel(mealsListUseCase: mealsListDIContainer.mealsListUseCase,
                                                    navigationStack: mealsPresenter)
        mealsListViewModel.coordinatorDelegate = self
        let mealsView = AnyView(MealsListView(viewModel: mealsListViewModel))
        rootPresenter.push(mealsView)
    }
}

extension MealsCoordinator: MealsListCoordinatorDelegate {
    
    func mealDetails(_ meal: MealRowViewModel) {
        
        let mealDetailsViewModel = MealDetailsViewModel(meal: meal)
        mealDetailsViewModel.coordinatorDelegate = self
        
        let mealDetailsView = MealDetailsView(viewModel: mealDetailsViewModel)
        mealsPresenter.push(mealDetailsView)
    }
    
    
}

extension MealsCoordinator: MealDetailsCoordinatorDelegate {
    
    func goBack() {
        mealsPresenter.pop()
    }
}
