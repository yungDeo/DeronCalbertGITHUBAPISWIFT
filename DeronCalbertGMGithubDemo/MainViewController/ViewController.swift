//
//  ViewController.swift
//  DeronCalbertGMGithubDemo
//
//  Created by Calbert, Deron on 1/16/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel:MainViewModel!
    let cellIdentifier = "CommitCell"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.getCommits() {
            finished in
            print(finished)
            self.tableView.reloadData()
            //print(self.viewModel.commits[0])
        }
        // Do any additional setup after loading the view.
    }


    
}
//MARK:- TableViewDataSource
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return commitCell(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    func commitCell( tableView:UITableView,indexPath:IndexPath) ->CommitTableViewCell? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier ) as? CommitTableViewCell {
            cell.authorLabel.text = viewModel.commits[indexPath.row].commit?.author?.name
            cell.commitHashLabel.text = viewModel.commits[indexPath.row].commit?.tree?.sha
                    cell.commitMessageLabel.text = viewModel.commits[indexPath.row].commit?.message
            
            return cell
        }
        return nil
    }
    
    
}
//MARK:- TableViewDelegate
extension ViewController:UITableViewDelegate {
    
}
