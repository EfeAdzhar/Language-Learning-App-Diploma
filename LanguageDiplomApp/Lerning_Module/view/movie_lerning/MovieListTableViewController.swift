//
//  MoviesTableViewController.swift
//  FilmMatcher
//
//  Created by Efe on 12.10.2023.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    
    private var viewModel : MovieListTableViewViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MovieListViewModel()
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieListTableViewCell
        
        guard let tableViewCell = cell,
              let viewModel = viewModel else {return UITableViewCell()}
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let viewModel = viewModel else {return}
        viewModel.selectRow(atIndexPath: indexPath)
        
        performSegue(withIdentifier: "descripionSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = viewModel else {return}
        
        if(identifier == "descripionSegue") {
            if let descriptionVC = segue.destination as? DescriptionViewController {
                descriptionVC.viewModel = viewModel.descriptionViewModel()
            }
        }
    }
}
