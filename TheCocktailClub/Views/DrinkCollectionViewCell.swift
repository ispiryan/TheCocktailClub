//
//  DrinkCollectionViewCell.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 31.08.22.
//

import UIKit
import SDWebImage

final class DrinkCollectionViewCell: UICollectionViewCell {
    static let identifier = "DrinkCollectionViewCellID"

    @IBOutlet weak var imageView: SDAnimatedImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func setup(urlString: String, title: String) {
        titleLabel.text = title

        imageView.sd_imageIndicator = SDWebImageActivityIndicator.medium
        imageView.sd_setImage(with: URL(string: urlString))
    }
}
