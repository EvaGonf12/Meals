
import SwiftUI

enum Fonts {

    struct Roboto {
        static let regular = "Roboto-Regular"
        static let medium = "Roboto-Medium"
        static let bold = "Roboto-Bold"
    }
    
    /// Value 40, Regular
    static let h1 = Font.custom(Roboto.regular, size: 40)
    
    /// Value 28, Regular
    static let h2 = Font.custom(Roboto.regular, size: 28)
    
    /// Value 24, Regular
    static let h3 = Font.custom(Roboto.regular, size: 24)
    
    /// Value 24, Medium
    static let h3Medium = Font.custom(Roboto.medium, size: 24)
    
    /// Value 18, Regular
    static let h4 = Font.custom(Roboto.regular, size: 18)
    
    /// Value 18, Medium
    static let h4Medium = Font.custom(Roboto.medium, size: 18)

    /// Value 16, Regular
    static let h5 = Font.custom(Roboto.regular, size: 16)

    /// Value 16, Medium
    static let h5Medium = Font.custom(Roboto.medium, size: 16)
    
    /// Value 16, Bold
    static let h5Bold = Font.custom(Roboto.bold, size: 16)
    
    /// Value 14, Regular
    static let h6 = Font.custom(Roboto.regular, size: 14)

    /// Value 14, Bold
    static let h6Bold = Font.custom(Roboto.bold, size: 14)

    /// Value 12, Regular
    static let h7 = Font.custom(Roboto.regular, size: 12)
    
    /// Value 16, Medium
    static let title = Font.custom(Roboto.medium, size: 16)
    
    /// Value 16, Medium
    static let link = Font.custom(Roboto.medium, size: 16)
}
