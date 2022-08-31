//
//  DrinksViewController.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import UIKit

final class DrinksViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!

    let viewModel: DrinksViewModel = DrinksViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()

        searchBar.delegate = self
    }


    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            if !isLoading {
                // reload data
                print(self?.viewModel.drinks)
            }
        }

        viewModel.errorMessage.bind { [weak self] message in
            if !message.isEmpty {
                self?.alert(message: message)
            }
        }
    }
}

extension DrinksViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.getDrinks(searchText: searchBar.text ?? "")
    }
}
