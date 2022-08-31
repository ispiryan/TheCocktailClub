//
//  String+Extension.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 31.08.22.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    var percentEncoded: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
}
