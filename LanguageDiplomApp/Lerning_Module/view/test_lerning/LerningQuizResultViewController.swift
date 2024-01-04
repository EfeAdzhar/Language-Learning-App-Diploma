//
//  LerningQuizResultViewController.swift
//  LanguageDiplomApp
//
//  Created by Efe on 27.12.23.
//

import UIKit

class LerningQuizResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var amountOfPoits: UILabel!
    var result = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.amountOfPoits.text = "\(result)"
        optionOnResult(result)
    }
    
    
    @IBAction func goToLerningScreenPressed(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "LearningMenu", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LearningMenuViewController") as! LearningMenuViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true)
    }
    
    func optionOnResult(_ result : Int) {
        if(result == 0) {
            resultLabel.text = "Oh, you only got 0. This topic is probably too much for you right now, try easier. Or maybe you were just testing the app?)"
        } else if(result > 0 && result <= 3) {
            resultLabel.text = "You probably missed something or maybe just forgoten, try to repeat the topic"
        } else if(result > 3 && result <= 6) {
            resultLabel.text = "Nice, but you can do better!"
        } else if(result > 6 && result <= 9) {
            resultLabel.text = "That is a great mark! But remember, you can always do better)"
        } else if(result == 10) {
            resultLabel.text = "Wow, that's amazing, all answers are correct! Great Job!"
        }
    }
}
