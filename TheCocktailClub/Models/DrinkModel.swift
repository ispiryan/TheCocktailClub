//
//  CocktailModel.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation

struct DrinksDTO: Codable {
    let drinks: [DrinkModel]?
}

// MARK: - DrinkModel
struct DrinkModel: Codable {
    let name: String
    let imageUrl: String

    enum CodingKeys: String, CodingKey{
        case name = "strDrink"
        case imageUrl = "strDrinkThumb"
    }
}
