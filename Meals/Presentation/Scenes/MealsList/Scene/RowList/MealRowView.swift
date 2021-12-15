//
//  MealRowView.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI
import Kingfisher

struct ItemRowView: View {
    private let viewModel: ItemRowViewModel
    
    init(viewModel: ItemRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(viewModel.item)
    }
}

struct MealRowView: View {
    
    private let viewModel: MealRowViewModel
    
    init(viewModel: MealRowViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let url = URL(string: viewModel.image) {
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
                    .overlay(TextOverlay(viewModel: viewModel))
            } else {
                PlaceholderImageView()
            }
        }.frame(height: 300)
    }
}

private struct TextOverlay: View {
    
    let viewModel: MealRowViewModel
    
    init(viewModel: MealRowViewModel) {
      self.viewModel = viewModel
    }

    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.title)
                    .bold()
                Text(viewModel.category)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
    
}

struct PlaceholderImageView: View {
   
    var body: some View {
        Image("no-photo")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 300, height: 300)
    }
}

struct MealRowView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MealRowViewModel(meal: Meal.mock4)
        MealRowView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }

}

