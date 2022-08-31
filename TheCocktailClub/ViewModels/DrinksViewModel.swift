//
//  DrinksViewModel.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation

final class DrinksViewModel {

    var drinks = [DrinkModel]()
    let isLoading = Box(false)
    let errorMessage = Box("")

    func getDrinks(searchText: String) {
        let service = NetworkService()
        let endpoint: DrinksEndpoint = .searchDrinks(searchText: searchText)
        isLoading.value = true

        service.request(endpoint: endpoint, dataType: DrinksDTO.self) { [weak self] result, error in
            guard let self = self else { return }
            if let error = error {
                self.errorMessage.value = error
            } else if let drinks = result?.drinks {
                self.drinks = drinks
            } else {
                self.errorMessage.value = "drinks.noDrinks".localized
                self.drinks.removeAll()
            }
            self.isLoading.value = false
        }
    }
}
