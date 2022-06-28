//
//  DefaultMealsListUseCase.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Combine

final class DefaultMealsListUseCase: MealsListUseCase {
    private let mealsRepository: MealsRepository
    
    init(mealsRepository: MealsRepository) {
        self.mealsRepository = mealsRepository
    }
    
    func execute() -> AnyPublisher<[Meal], APIError> {
        let params = MealsListReqParams(category: "a")
        return mealsRepository.getMealsList(with: params)
    }
}

