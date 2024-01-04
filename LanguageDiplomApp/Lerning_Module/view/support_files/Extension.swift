//
//  Extension.swift
//  LanguageDiplomApp
//
//  Created by Efe on 02.01.24.
//

import Foundation
import UIKit

extension LearningQuizViewController {
    func setUpLayoutAndFieldsForAwakeFromNib() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.quizCollectionView.collectionViewLayout = layout
        quizCollectionView.delegate = self
        quizCollectionView.dataSource = self
    }
}
