//
//  MealDetailsView.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI
import Kingfisher

struct MealDetailsView: View {
    private var viewModel: MealDetailsViewModel
    
    init(viewModel: MealDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if let url = URL(string: viewModel.meal.image) {
                        KFImage(url)
                            .placeholder {
                                PlaceholderImageView()
                            }
                            .loadDiskFileSynchronously()
                            .fade(duration: 0.15)
                            .onProgress { receivedSize, totalSize in  }
                            .onSuccess { result in  }
                            .onFailure { error in }
                            .resizable()
                            .frame(height: 300)
                    } else {
                        PlaceholderImageView()
                            .frame(height: 300)
                    }
                    Text(viewModel.meal.category)
                        .font(Fonts.title)
                        .foregroundColor(CustomColor.Grays.extra)
                        .padding(.horizontal, Spacing.m)
                    Text(viewModel.meal.instructions)
                        .font(Fonts.h6)
                        .foregroundColor(CustomColor.Grays.extra)
                        .padding(.horizontal, Spacing.m)
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationAppearance(backgroundColor: .white, foregroundColor: CustomUIColor.Primary.blueDark)
            .navigationBarItems(leading: Button {
                viewModel.back()
            } label: {
                Image(systemName: "chevron.left")
                    .font(Fonts.h4)
                    .foregroundColor(CustomColor.Primary.blueDark)
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let mealViewRowModel = MealRowViewModel(meal: Meal.mock4)
        let mealDetailsViewModel = MealDetailsViewModel(meal: mealViewRowModel)
        return MealDetailsView(viewModel: mealDetailsViewModel)
    }
}
