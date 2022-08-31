//
//  CocktailModel.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation

struct CocktailModel: Codable {
    let name: String
    let imageUrl: String

    enum CodingKeys: String, CodingKey{
        case name = "name"
        case imageUrl = "imageUrl"
    }
}
