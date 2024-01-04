//
//  LearningMenuViewController.swift
//  LanguageDiplomApp
//
//  Created by Efe on 27.12.23.
//

import UIKit

class LearningMenuViewController: UIViewController {
    
    @IBOutlet weak var chooseTopicButton: UIButton!
    @IBOutlet weak var chooseLerningStyleButton: UIButton!
    
    var lerningStylesAndTopicsDataSourse = [LerningStylesAndTopics]()
    
    let transparantView = UIView()
    let tableView = UITableView()
    var selectedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LearningMenuTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    @IBAction func chooseTopicButtonPressed(_ sender: Any) {
        lerningStylesAndTopicsDataSourse = [.A2]
        selectedButton = chooseTopicButton
        addTransparantView(frame: chooseTopicButton.frame)
    }
    
    
    @IBAction func chooseLerningStyleButtonPressed(_ sender: Any) {
        lerningStylesAndTopicsDataSourse = [.TESTING_EFFECT, .VISUAL, .ADDICTIVENESS]
        selectedButton = chooseLerningStyleButton
        addTransparantView(frame: chooseLerningStyleButton.frame)
    }
    
    func addTransparantView(frame : CGRect) {
        //Creating Window
        let window = UIApplication.shared.keyWindow
        
        //TransparentView Frame equals to Windows Frame.
        //Adding it to our view
        transparantView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparantView)
        
        //Making TableView Frame hegiht 0 in static
        //Adding it to our view
        tableView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height, width: frame.width, height: 0)
        self.view.addSubview(tableView)
        
        //Making Corner Radius of TableView 5
        tableView.layer.cornerRadius = 5
        
        //Make TransparantView background with alpha so it will add a little darkness to it
        transparantView.backgroundColor = .black.withAlphaComponent(0.9)
        
        tableView.reloadData()
        
        //Creating Tap in removing TransparantView
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeTransparantView))
        transparantView.addGestureRecognizer(tap)
        transparantView.alpha = 0
        
        //Add animation to TransparantView and TableView
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            self.transparantView.alpha = 0.5
            self.tableView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height + 5, width: frame.width, height: CGFloat(self.lerningStylesAndTopicsDataSourse.count * 50))
        }, completion: nil)
    }
    
    @objc func removeTransparantView() {
        let frame = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            self.transparantView.alpha = 0
            self.tableView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height, width: frame.width, height: 0)
        }, completion: nil)
    }
    
    @IBAction func startQuizButtonPressed(_ sender: Any) {
        //MARK: TEST METHOD
        if(chooseLerningStyleButton.titleLabel?.text == "TESTING_EFFECT") {
            let storyBoard: UIStoryboard = UIStoryboard(name: "LearningQuiz", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "LearningQuizViewController") as! LearningQuizViewController
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true)
        }
        //MARK: AR METHOD

        else if(chooseLerningStyleButton.titleLabel?.text == "VISUAL") {
            let storyBoard: UIStoryboard = UIStoryboard(name: "ARObjectRecognition", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ARVisualLerningViewController") as! ARVisualLerningViewController
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true)
        }
        //MARK: MOVIE METHOD
        else if(chooseLerningStyleButton.titleLabel?.text == "ADDICTIVENESS") {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Movies", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "MovieListTableViewController") as! MovieListTableViewController
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true)
        }
    }
}


extension LearningMenuViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lerningStylesAndTopicsDataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String.init(describing: lerningStylesAndTopicsDataSourse[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(String.init(describing: lerningStylesAndTopicsDataSourse[indexPath.row]), for: .normal)
    }
}
