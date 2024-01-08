//  LearningQuizViewController.swift
//  LanguageDiplomApp
//  Created by Efe on 27.12.23.

import UIKit

class LearningQuizViewController: UIViewController {
    
    @IBOutlet weak var quizCollectionView: UICollectionView!
    
    private var viewModel = QuestionsViewModel()
    
    var answerSelected = false
    var isCorrectAnswer = false
    var dto = BayesianTestingMethodDto()
    var points = 0
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayoutAndFieldsForAwakeFromNib()
        
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if(!answerSelected) {
            //error
        }
        if(isCorrectAnswer) {
            points+=1
        }
        if(index < viewModel.count() - 1) {
        index += 1
        quizCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
            
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "LearningQuizResult", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "LearningQuizResultViewController") as! LerningQuizResultViewController
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.result = points
            self.present(newViewController, animated: true)
        }
}
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension LearningQuizViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as? QuizCollectionViewCell else {return UICollectionViewCell()}
        viewModel.setIndexPath(indexPath)
        cell.viewModel = viewModel.quizCollectionViewCellViewModel()
        cell.optionA.layer.cornerRadius = 5
        cell.optionB.layer.cornerRadius = 5
        cell.optionC.layer.cornerRadius = 5
        cell.optionD.layer.cornerRadius = 5
        cell.selectedOptionHandler = {[weak self] isCorrect in
            self?.answerSelected = true
            self?.isCorrectAnswer = isCorrect
        }
        dto.question = cell.viewModel?.question
        dto.priorProbabilities = cell.viewModel?.priorProbabilities
        print(dto)
        return cell
    }
}

extension LearningQuizViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
    }
}
