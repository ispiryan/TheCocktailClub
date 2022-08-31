//
//  Response.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation

struct Response<T: Codable>: Codable {
    let error: String?
    let data: T?

    var localizedError: String {
        return error ?? "error.gen".localized
    }
}

struct Empty: Codable {

}
