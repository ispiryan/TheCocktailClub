//
//  Endpoint.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var url: URL { get }
}

extension Endpoint {
    var baseURL: String {
        Constants.baseUrlString
    }
}
