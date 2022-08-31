//
//  Response.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation

struct Response<T>: Codable {
    let data: Data?
    let error: String?
    let success: Bool
}
