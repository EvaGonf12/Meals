//
//  AppCoordinator.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI
import UIKit
import NavigationStack

enum MainRedirection {
    case MealsList
}

class AppCoordinator: Coordinator {

    // Dependency
    lazy var appDIContainer: AppDIContainer = {
        return AppDIContainer()
    }()
    
    let rootPresenter: NavigationStack
    let window: UIWindow
    
    init(rootPresenter: NavigationStack,
         window: UIWindow) {
        
        self.rootPresenter = rootPresenter
        self.window = window
    }
    
    override func start() {
        
        let mainViewModel = MainViewModel(navigationStack: rootPresenter)
        mainViewModel.coordinatorDelegate = self
        let mainView = AnyView(MainView(viewModel: mainViewModel))

        window.rootViewController = UIHostingController(rootView: mainView)
        window.makeKeyAndVisible()
    }
    
    override func finish() {}
}
