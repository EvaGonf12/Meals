//
//  MainViewModel.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Combine
import SwiftUI
import NavigationStack

enum MainSceneState {
    case loading
    case mealsList
}

final class MainViewModel: ObservableObject {
    
    private var disposables: Set<AnyCancellable>
    var coordinatorDelegate: MainCoordinatorDelegate?
    @Published var state: MainSceneState
    
    let navigationStack: NavigationStack
    
    init(navigationStack: NavigationStack,
         state: MainSceneState = .loading,
         disposables: Set<AnyCancellable> = Set<AnyCancellable>()) {
        
        self.navigationStack = navigationStack
        self.state = state
        self.disposables = disposables
    }
    
    func didAppear() {
        
        Utils.wait {[weak self] in
            self?.showMealsList()
        }
    }
    
    func showMealsList() {
        coordinatorDelegate?.goScreen(.MealsList)
    }
}
