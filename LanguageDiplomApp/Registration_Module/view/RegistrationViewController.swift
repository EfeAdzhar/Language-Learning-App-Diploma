//
//  RegistrationViewController.swift
//  LanguageDiplomApp
//
//  Created by Efe on 26.12.23.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func pre(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "LearningMenu", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LearningMenuViewController") as! LearningMenuViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true)
    }
}
