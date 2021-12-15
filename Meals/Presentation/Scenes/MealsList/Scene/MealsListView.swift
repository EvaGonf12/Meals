//
//  MealsListView.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI
import NavigationStack

struct MealsListView: View {
    
    @ObservedObject var viewModel: MealsListViewModel
    
    init(viewModel: MealsListViewModel) {
        self.viewModel = viewModel
        UINavigationBar.appearance().tintColor = .black
    }
    
    var body: some View {
        
        NavigationStackView(transitionType: .custom(.opacity),
                            navigationStack: viewModel.navigationStack) {
            
            switch viewModel.state {
            case .loading:
                Spinner()
                    .navbarType(title: "Meals 🍱", display: .inline)
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.fetchMealsList)
                    .navbarType(title: "Meals 🍱", display: .inline)
            case .success:
                if viewModel.mealsList.isEmpty {
                    emptyView
                        .navbarType(title: "Meals 🍱", display: .inline)
                } else {
                    mealsList
                        .navbarType(title: "Meals 🍱", display: .inline)
                }
            }
        }
        .onAppear {
            viewModel.didAppear()
        }
    }
}

private extension MealsListView {
    
    var mealsList: some View {
        ScrollView {
            VStack {
                Text("\(Texts.MealsList.title) 🍱")
                    .font(Fonts.h3Medium)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                ForEach(viewModel.mealsList) { meal in
                    MealRowView(viewModel: meal)
                        .onTapGesture {
                            viewModel.mealSelected(meal)
                        }
                }
            }
        }
    }
    
    var emptyView: some View {
        Text("No results")
            .foregroundColor(.gray)
    }
}

struct MealsListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let viewModel = MealsListViewModel(mealsListUseCase: AppDIContainer().makeMealsSceneDIContainer().mealsListUseCase,
                                           navigationStack: NavigationStack())
        viewModel.mealsList = Meal.mockList.map(MealRowViewModel.init)
        return MealsListView(viewModel: viewModel)
    }
}
