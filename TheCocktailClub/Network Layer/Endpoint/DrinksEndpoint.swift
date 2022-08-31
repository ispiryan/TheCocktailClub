//
//  DrinksEndpoint.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 31.08.22.
//

import Foundation

private let searchPath = "search.php?s="

enum DrinksEndpoint: Endpoint {
    case searchDrinks(searchText: String)

    var path: String {
        switch self {
        case .searchDrinks(let searchText):
            return searchPath + searchText.percentEncoded
        }
    }

    var url: URL {
        let urlString = "\(baseURL)\(path)"
        if let url = URL(string: urlString) {
            return url
        } else {
            fatalError("DrinksEndpoint can't create URL!")
        }
    }
}
