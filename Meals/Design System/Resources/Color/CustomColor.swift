//
//  CustomColor.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import SwiftUI

enum CustomColor {
    
    struct Grays {
        /// #F2F2F2
        static let light = Color(#colorLiteral(red: 0.9490198493, green: 0.9490196109, blue: 0.9490197301, alpha: 1))
        /// #DDDDDD
        static let medium = Color(#colorLiteral(red: 0.8666666667, green: 0.8666667342, blue: 0.8666666746, alpha: 1))
        /// #AAAAAA
        static let regular = Color(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1))
        /// #757575
        static let dark = Color(#colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1))
        /// #464646
        static let extra = Color(#colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1))
    }
    
    struct Primary {
        /// #42A9BB
        static let blue = Color(#colorLiteral(red: 0.2588235294, green: 0.662745098, blue: 0.7333333333, alpha: 1))
        /// #1A4766
        static let blueDark = Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))
    }
}
