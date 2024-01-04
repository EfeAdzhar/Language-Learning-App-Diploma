//
//  Extensions.swift
//  LanguageDiplomApp
//
//  Created by Efe on 18.12.23.
//

import Foundation
import UIKit

extension QuestionCollectionView {
    func setUpLayout() {
        let layout = UICollectionViewFlowLayout()
        self.collectionViewLayout = layout
        self.delegate = self
        self.dataSource = self
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    func setUpNib() {
        let horizontalNib = UINib(nibName: "HorizontalCell", bundle: nil)
        register(horizontalNib, forCellWithReuseIdentifier: "horizontalCell")
    }
}
