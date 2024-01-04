//
//  QuestionTableView.swift
//  LanguageDiplomApp
//
//  Created by Efe on 08.12.23.
//

import Foundation
import UIKit

class QuestionCollectionView : UICollectionView {
    
    var viewModel : CollectionViewCellViewModelType? {
        didSet {
            self.reloadData()
        }
    }
    
    var amoutOfRightAnswers = 0
    
    private var resultService = ResultsService()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpLayout()
        setUpNib()
    }
}

extension QuestionCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // MARK: [Answers].count
        return viewModel?.answers.answers.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
                dequeueReusableCell(withReuseIdentifier: CollectionViewCell.IDENTIFIER, for: indexPath) as? CollectionViewCell
        else {return UICollectionViewCell()}
        cell.question.text = viewModel?.answers.answers[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
           for cell in collectionView.visibleCells {
               if let cell = cell as? CollectionViewCell {
                   cell.contentView.backgroundColor = .white
               }
           }
        
        selectedCell.isMultipleTouchEnabled = true
        selectedCell.contentView.backgroundColor = .lightGray
        switch viewModel?.questionType {
        case .QUESTION :
            resultService.addQuestionAnswer(selectedCell.question.text!)
        case .QUIZ :
            let answer = selectedCell.question.text
            if(viewModel?.answer == answer) {
                resultService.addRightQuizAnswer()
                amoutOfRightAnswers = resultService.getRightAnswersResult()
            }
        case .none:
            print("error in collectionView didSelectItemAt")
        }
   }
}

extension QuestionCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width, height: self.frame.size.height/4.6)
    }
}
