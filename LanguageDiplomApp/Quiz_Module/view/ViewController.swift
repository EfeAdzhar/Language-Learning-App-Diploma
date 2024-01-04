//
//  ViewController.swift
//  LanguageDiplomApp
//
//  Created by Efe on 05.12.23.
//

import UIKit

private enum ButtonTitle {
    static let questions = "Questions"
    static let takeQuiz = "Take Quiz"
    static let registrate = "Registrate"
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var question: UILabel!
    @IBOutlet weak var questionCollectionView: QuestionCollectionView!
    private var viewModel : QuizViewModelType?
    private var resultService : ResultsService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = QuestionViewModel()
        resultService = ResultsService()
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        
        guard let title = sender.titleLabel?.text else { return }
        switch title {
        case ButtonTitle.questions:
            handleQuestionsButtonPress(sender)
        case ButtonTitle.takeQuiz:
            handleTakeQuizButtonPress(sender)
        case ButtonTitle.registrate:
            handleRegistrateButtonPress(sender)
        default:
            break
        }
    }
}
    
private extension ViewController {
    func handleQuestionsButtonPress(_ sender : UIButton) {
        questionCollectionView.viewModel = viewModel?.cellViewModel(.QUESTION)
        let cellViewModel = questionCollectionView.viewModel
        ResultsService.increaseCounter()
        if let questionText = cellViewModel?.question, !questionText.isEmpty {
            question.text = questionText
        } else {
            question.text = "Done, I see you have more interest in visual lerning. That's cool, but our app provides other methods to learn the language, we highly recommend to use all methods so that your exprience will be much more bright! Now let's take a quiz to define your knowledge of the selected language!"
            updateButtonTitle(sender, ButtonTitle.takeQuiz)
        }
    }

    func handleTakeQuizButtonPress(_ sender : UIButton) {
        questionCollectionView.viewModel = viewModel?.cellViewModel(.QUIZ)
        let cellViewModel = questionCollectionView.viewModel
        if let questionText = cellViewModel?.question, !questionText.isEmpty {
            question.text = questionText
        } else {
            let result = questionCollectionView.amoutOfRightAnswers
            question.text = "Done, here is your results: \(String(describing: result)). Your level of language is: \(optionOnResult(result))"
            updateButtonTitle(sender, ButtonTitle.registrate)
        }
    }

    func handleRegistrateButtonPress(_ sender : UIButton) {
        if sender.isTouchInside && sender.titleLabel?.text == ButtonTitle.registrate {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Registration", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true)
        }
    }

    func updateButtonTitle(_ sender : UIButton, _ title: String) {
        sender.setTitle(title, for: .normal)
        sender.titleLabel?.font = .systemFont(ofSize: 27.0, weight: .bold)
    }

func optionOnResult(_ result : Int) -> String {
    if(result == 0) {
        return "A0. You are a nooby, but it's ok, we're all been there :)"
    } else if(result > 0 && result <= 1) {
        return "A1. You're already familiar with very basic language grammer and vocabulary. Nice!"
    } else if(result >= 2 && result <= 6) {
       return "A2. You'are already have some good grammar and vocabluary base for interaction. Cool!"
    } else if(result >= 7 && result <= 9) {
        return "B1. You'are already have good grammar and vocabluary base. Very nice!"
    } else if(result == 10) {
        return "B2. You'are already have some fluency in most grammar and vocabluary. Awesome!"
    }
    return ""
  }
}
