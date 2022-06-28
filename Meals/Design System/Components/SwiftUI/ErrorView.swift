//
//  ErrorView.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI

struct ErrorView: View {

    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error,
                  handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }

    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.red)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Text("Ooooops")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy, design: .default))
                .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(.subheadline))
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            
            Button(action: {
                handler()
            }, label: {
                Text("Retry")
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .foregroundColor(.white)
            .background(Color.blue)
            .font(.system(size: 15, weight: .heavy))
            .cornerRadius(10)
        }
    }
    
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {
            
        }
        .previewLayout(.sizeThatFits)
    }
}
