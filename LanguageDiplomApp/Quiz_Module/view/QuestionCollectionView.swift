//
//  QuestionTableView.swift
//  LanguageDiplomApp
//
//  Created by Efe on 08.12.23.
//

import Foundation
import UIKit

class QuestionCollectionView : UICollectionView {
    
    var questionViewModel : CollectionQuestionViewCellViewModelType? {
        didSet {
            self.reloadData()
        }
    }
    
    var quizViewModel : CollectionQuizViewCellViewModelType? {
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
        if(questionViewModel == nil) {
            return quizViewModel?.answers.answers.count ?? 0
        } else {
            return questionViewModel?.answers.answers.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
                dequeueReusableCell(withReuseIdentifier: CollectionViewCell.IDENTIFIER, for: indexPath) as? CollectionViewCell
        else {return UICollectionViewCell()}
        
        if(questionViewModel == nil) {
            cell.question.text = quizViewModel?.answers.answers[indexPath.row]
            } else {
                cell.question.text = questionViewModel?.answers.answers[indexPath.row]
            }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
           defaultCellColor(collectionView)
        
        selectedCell.isMultipleTouchEnabled = true
        selectedCell.contentView.backgroundColor = .lightGray
        
        if(questionViewModel != nil) {
            questionViewModelCheckAnswer(selectedCell)
        }
        else if(quizViewModel != nil) {
            quizViewModelCheckAnswer(indexPath.row, selectedCell)
        } else {
            print("error in collectionView didSelectItemAt")
        }
   }
}

extension QuestionCollectionView {
    
    func defaultCellColor(_ collectionView : UICollectionView) {
        for cell in collectionView.visibleCells {
            if let cell = cell as? CollectionViewCell {
                cell.contentView.backgroundColor = .white
            }
        }
    }
}

extension QuestionCollectionView {
    
    func questionViewModelCheckAnswer(_ selectedCell : CollectionViewCell) {
        resultService.addQuestionAnswer(selectedCell.question.text!)

    }
    
    func quizViewModelCheckAnswer(_ indexPathRow : Int, _ selectedCell : CollectionViewCell) {
        let selectedIndex = indexPathRow
        resultService.setBayesianParameters(priorProbabilities: (quizViewModel?.priorProbabilities)!, difficulty: quizViewModel!.difficulty)
        let answer = selectedCell.question.text
        
        if(quizViewModel?.answer == answer) {
            resultService.addRightQuizAnswer()
            amoutOfRightAnswers = resultService.getRightAnswersResult()
            resultService.updateProbabilities(selectedAnswerIndex: selectedIndex, isCorrectAnswer: true)
        } else {
            resultService.updateProbabilities(selectedAnswerIndex: selectedIndex, isCorrectAnswer: false)
        }
        let dto = BayesianTestingMethodDto(question: quizViewModel?.question,
                                           priorProbabilities: resultService.getRepository().getBayesianMethod().lastComputedPosteriorProbabilities)
        resultService.addUpdatedPosteriorProbabilities(dto)
    }
}

extension QuestionCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width, height: self.frame.size.height/4.6)
    }
}
