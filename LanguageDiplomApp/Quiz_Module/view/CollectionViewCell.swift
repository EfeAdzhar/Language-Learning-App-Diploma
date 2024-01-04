//
//  CollectionViewCell.swift
//  LanguageDiplomApp
//
//  Created by Efe on 08.12.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var question: UILabel!
    
    public static let IDENTIFIER = "horizontalCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        self.tintColor = .black
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
}
