//
//  Spinner.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI

struct Spinner: View {
    var body: some View {
        if #available(iOS 14.0, *) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: CustomColor.Primary.blue))
        } else {
            ActivityIndicator(isAnimating: .constant(true), style: .large)
        }
    }
}

struct Spinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner()
    }
}
