//
//  Decoder.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation


struct Decoder {
    func decode<T>(_ type: T.Type, data: Data) throws -> T where T: Decodable {
        try JSONDecoder().decode(type, from: data)
    }
}

