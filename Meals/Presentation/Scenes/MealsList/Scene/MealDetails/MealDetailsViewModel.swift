//
//  MealDetailsViewModel.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI

class MealDetailsViewModel: ObservableObject {
    
    let meal: MealRowViewModel
    var coordinatorDelegate: MealDetailsCoordinatorDelegate?
    
    init(meal: MealRowViewModel) {
        self.meal = meal
    }
    
    func back() {
        coordinatorDelegate?.goBack()
    }
}
