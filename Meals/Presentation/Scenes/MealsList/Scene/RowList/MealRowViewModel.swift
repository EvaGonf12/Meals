//
//  MealRowViewModel.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation
import SwiftUI

struct ItemRowViewModel: Identifiable, Hashable {
    let id: UUID
    
    let item: String
    
    init(item: String) {
        self.id = UUID()
        self.item = item
    }
    
    static func == (lhs: ItemRowViewModel, rhs: ItemRowViewModel) -> Bool {
      return lhs.item == rhs.item
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(self.item)
    }
}

struct MealRowViewModel: Identifiable {
    
    private let meal: Meal
    
    var id: String {
        return meal.id
    }
    
    var image: String {
        return meal.image
    }
    
    var name: String {
        return meal.name
    }
    
    var category: String {
        return meal.category
    }
    
    var instructions: String {
        return meal.instructions
    }
    
    init(meal: Meal) {
        self.meal = meal
    }
}

extension MealRowViewModel: Hashable {
  static func == (lhs: MealRowViewModel, rhs: MealRowViewModel) -> Bool {
    return lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
  }
}
