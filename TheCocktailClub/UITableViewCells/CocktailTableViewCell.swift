//
//  CocktailTableViewCell.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import UIKit

final class CocktailTableViewCell: UITableViewCell {

    static let identifier = "CocktailTableViewCellID"

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
