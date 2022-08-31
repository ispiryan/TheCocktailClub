//
//  EndPoint.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation

let baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/"

struct EndPoint {
    let urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }

    var url: URL? {
        URL(string: baseUrl + urlString)
    }
}
