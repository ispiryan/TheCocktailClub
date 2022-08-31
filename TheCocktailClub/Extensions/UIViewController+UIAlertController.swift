//
//  UIViewController+UIAlertController.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 31.08.22.
//

import UIKit

extension UIViewController {
    func alert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "common.ok".localized, style: .cancel, handler: nil)
        alertController.addAction(button)
        self.present(alertController, animated: true, completion: nil)
    }
}
