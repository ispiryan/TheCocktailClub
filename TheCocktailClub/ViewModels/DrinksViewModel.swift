//
//  DrinksViewModel.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation

struct DrinksViewModel {

    var drinks: [CocktailModel] = [CocktailModel]()

    func getDrinks(searchText: String, completion: @escaping (_ result: [CocktailModel]) -> Void) {

        let endPoint = EndPoint(urlString: "search.php?s=\"" + searchText)

        guard let url = endPoint.url else {
            completion([CocktailModel]())
            return
        }

        let networkService = NetworkService()
        let service = NetworkService()

        service.request(url: url, dataType: [CocktailModel].self) { result, error in

        }
//        service.request(url: endPoint.url, dataType: [CocktailModel].Type) { [weak self] result in
//
//        }
        
    }
}
