//
//  Meal.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation

struct Meal: Identifiable {
    let id: String
    let name: String
    let category: String
    let area: String
    let instructions: String
    let image: String
    let isFavorite: Bool
    
    init(apiResponse: MealResponse) {
        self.id = apiResponse.idMeal ?? ""
        self.name = apiResponse.strMeal ?? ""
        self.category = apiResponse.strCategory ?? ""
        self.area = apiResponse.strArea ?? ""
        self.instructions = apiResponse.strInstructions ?? ""
        self.image = apiResponse.strMealThumb ?? ""
        self.isFavorite = false
    }
    
    init(id: String,
         name: String,
         category: String,
         area: String,
         instructions: String,
         image: String) {
        
        self.id = id
        self.name = name
        self.category = category
        self.area = area
        self.instructions = instructions
        self.image = image
        self.isFavorite = false
    }
}

extension Meal {
    
    static var mockList = [mock, mock2, mock3, mock4]
    
    static var mock: Meal {
        .init(id: "52768",
              name: "Apple Frangipan Tart",
              category: "Dessert",
              area: "British",
              instructions: "Preheat the oven to 200C/180C Fan/Gas 6.\r\nPut the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.\r\nCream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.\r\nPeel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.\r\nBake for 20-25 minutes until golden-brown and set.\r\nRemove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.\r\nTransfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, cr??me fraiche or ice cream",
              image: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg")
    }
    
    static var mock2: Meal {
        .init(id: "52893",
              name: "Apple & Blackberry Crumble",
              category: "Dessert",
              area: "British",
              instructions: "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.",
              image: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
    }
    
    static var mock3: Meal {
        .init(id: "53049",
              name: "Apam balik",
              category: "Dessert",
              area: "Malaysian",
              instructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.",
              image: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    }
    
    static var mock4: Meal {
        .init( id: "53050",
               name: "Ayam Percik",
               category: "Chicken",
               area: "Malaysian",
               instructions: "In a blender, add the ingredients for the spice paste and blend until smooth.\r\nOver medium heat, pour the spice paste in a skillet or pan and fry for 10 minutes until fragrant. Add water or oil 1 tablespoon at a time if the paste becomes too dry. Don't burn the paste. Lower the fire slightly if needed.\r\nAdd the cloves, cardamom, tamarind pulp, coconut milk, water, sugar and salt. Turn the heat up and bring the mixture to boil. Turn the heat to medium low and simmer for 10 minutes. Stir occasionally. It will reduce slightly. This is the marinade/sauce, so taste and adjust seasoning if necessary. Don't worry if it's slightly bitter. It will go away when roasting.\r\nWhen the marinade/sauce has cooled, pour everything over the chicken and marinate overnight to two days.\r\nPreheat the oven to 425 F.\r\nRemove the chicken from the marinade. Spoon the marinade onto a greased (or aluminum lined) baking sheet. Lay the chicken on top of the sauce (make sure the chicken covers the sauce and the sauce isn't exposed or it'll burn) and spread the remaining marinade on the chicken. Roast for 35-45 minutes or until internal temp of the thickest part of chicken is at least 175 F.\r\nLet chicken rest for 5 minutes. Brush the chicken with some of the oil. Serve chicken with the sauce over steamed rice (or coconut rice).",
               image: "https://www.themealdb.com/images/media/meals/020z181619788503.jpg")
    }
}
