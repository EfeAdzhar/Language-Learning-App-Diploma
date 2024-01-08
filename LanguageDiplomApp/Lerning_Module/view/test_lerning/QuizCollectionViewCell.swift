//
//  QuizCollectionViewCell.swift
//  LanguageDiplomApp
//
//  Created by Efe on 27.12.23.
//

import UIKit

enum SelectedOption {
    case OPTION_A
    case OPTION_B
    case OPTION_C
    case OPTION_D
}

class QuizCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var option1: UILabel!
    @IBOutlet weak var option2: UILabel!
    @IBOutlet weak var option3: UILabel!
    @IBOutlet weak var option4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        optionA.addTarget(self, action: #selector(changeBorder(_:)), for: .touchUpInside)
        optionB.addTarget(self, action: #selector(changeBorder(_:)), for: .touchUpInside)
        optionC.addTarget(self, action: #selector(changeBorder(_:)), for: .touchUpInside)
        optionD.addTarget(self, action: #selector(changeBorder(_:)), for: .touchUpInside)
    }
    
    @IBOutlet weak var optionA: UIControl!
    @IBOutlet weak var optionB: UIControl!
    @IBOutlet weak var optionC: UIControl!
    @IBOutlet weak var optionD: UIControl!
    
    private var correctAnswer : String?
    var selectedOptionHandler: ((_ selectedAnswer : Bool) -> Void)?

    
    var viewModel : QuizCollectionViewCellViewModelType? {
        didSet {
            self.question.text = viewModel?.question
            self.option1.text = viewModel?.option_1
            self.option2.text = viewModel?.option_2
            self.option3.text = viewModel?.option_3
            self.option4.text = viewModel?.option_4
            self.correctAnswer = viewModel?.correct_answer
        }
    }
        
    
    @objc func changeBorder(_ selectedOption : UIControl) {
        switch selectedOption {
        case optionA:
            updateBorder(optionA, 5)
            updateBorder(optionB)
            updateBorder(optionC)
            updateBorder(optionD)
            isCorrect(.OPTION_A)
        case optionB:
            updateBorder(optionB, 5)
            updateBorder(optionA)
            updateBorder(optionC)
            updateBorder(optionD)
            isCorrect(.OPTION_B)
        case optionC:
            updateBorder(optionC, 5)
            updateBorder(optionA)
            updateBorder(optionB)
            updateBorder(optionD)
            isCorrect(.OPTION_C)
        case optionD:
            updateBorder(optionD, 5)
            updateBorder(optionA)
            updateBorder(optionC)
            updateBorder(optionB)
            isCorrect(.OPTION_D)
        default:
            updateBorder(optionD)
            updateBorder(optionA)
            updateBorder(optionC)
            updateBorder(optionB)
        }
    }
        
    func updateBorder(_ myView: UIView, _ borderWidth : CGFloat = 0) {
        myView.layer.borderWidth = borderWidth
        myView.layer.borderColor = UIColor.white.cgColor
    }
    
    func isCorrect(_ selected : SelectedOption) {
        var isCorrect = false
        switch selected {
        case .OPTION_A:
            if(correctAnswer == viewModel?.option_1) {
                isCorrect = true
            }
            selectedOptionHandler?(isCorrect)
            print(isCorrect)
        case .OPTION_B:
            if(correctAnswer == viewModel?.option_2) {
                isCorrect = true
            }
            selectedOptionHandler?(isCorrect)
            print(isCorrect)
        case .OPTION_C:
            if(correctAnswer == viewModel?.option_3) {
                isCorrect = true
            }
            selectedOptionHandler?(isCorrect)
            print(isCorrect)
        case .OPTION_D:
            if(correctAnswer == viewModel?.option_4) {
                isCorrect = true
            }
            selectedOptionHandler?(isCorrect)
            print(isCorrect)
        }
    }
}
