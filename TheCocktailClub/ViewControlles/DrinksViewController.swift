//
//  DrinksViewController.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import UIKit

final class DrinksViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!

    private let viewModel: DrinksViewModel = DrinksViewModel()
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 20.0,
                                             bottom: 10.0, right: 20.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupCollectionView()
        setupSearchBar()
        viewModel.getDrinks(searchText: "")
    }

    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            if !isLoading {
                self?.collectionView.reloadData()
            }
        }

        viewModel.errorMessage.bind { [weak self] message in
            if !message.isEmpty {
                self?.alert(message: message)
            }
        }
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "searchBar.placeholder".localized
        searchBar.returnKeyType = .done
    }
}

// MARK: - UISearchBarDelegate
extension DrinksViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.getDrinks(searchText: searchBar.text ?? "")
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension DrinksViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.drinks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell( withReuseIdentifier: DrinkCollectionViewCell.identifier,
                                                             for: indexPath ) as? DrinkCollectionViewCell else {
            return UICollectionViewCell()
        }
        let model = viewModel.drinks[indexPath.row]
        cell.setup(urlString: model.imageUrl, title: model.name)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DrinksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAt indexPath: IndexPath ) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         insetForSectionAt section: Int ) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         minimumLineSpacingForSectionAt section: Int ) -> CGFloat {
        return sectionInsets.left
    }
}
