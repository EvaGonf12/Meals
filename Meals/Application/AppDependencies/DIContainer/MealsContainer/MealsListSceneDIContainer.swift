//
//  MealsListSceneDIContainer.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI

final class MealsListSceneDIContainer {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Use Case
    lazy var mealsListUseCase: MealsListUseCase = {
        return DefaultMealsListUseCase(mealsRepository: mealsRepository)
    }()
    
    // MARK: - Repositories
    lazy var mealsRepository: MealsRepository = {
        return DefaultMealsRepository(remoteDataSource: mealsDataSource)
    }()

    
    // MARK: - Data Source
    private lazy var mealsDataSource: MealsDataSource = {
        return DefaultMealsDataSource(networkService: networkService,
                                      listMapper: mealsListRemoteMapper)
    }()
    
    // MARK: - Mapper
    
    private lazy var mealsListRemoteMapper: MealsListRemoteToEntityMapper = {
       return MealsListRemoteToEntityMapper()
    }()
}
