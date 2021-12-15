//
//  MainView.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI
import NavigationStack

struct MainView: View {
    
    let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStackView(transitionType: .custom(.opacity),
                            navigationStack: viewModel.navigationStack) {
            VStack {
                Icons.logo
                    .resizable()
                    .frame(width: 150, height: 150)
                Spinner()
                    .padding()
            }
            
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                viewModel.didAppear()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        
        let viewModel = MainViewModel(navigationStack: NavigationStack())
        MainView(viewModel: viewModel)
    }
}
