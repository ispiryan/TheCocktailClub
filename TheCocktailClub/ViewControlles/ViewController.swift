//
//  ViewController.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    let viewModel: DrinksViewModel = DrinksViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UINib(nibName: String(describing: CocktailTableViewCell.self), bundle: nil),
                           forCellReuseIdentifier: CocktailTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ViewController: UISearchBarDelegate {
    
}
