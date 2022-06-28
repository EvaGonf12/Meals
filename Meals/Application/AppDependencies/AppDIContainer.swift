//
//  AppDIContainer.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation

final class AppDIContainer {

    /*
        MARK: - Remote Service
     */
    
    /// Combine Backend Service
    lazy var networkService: APIService = {
        let network = APIService()
        return network
    }()
}
