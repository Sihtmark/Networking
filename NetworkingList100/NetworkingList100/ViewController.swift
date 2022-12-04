//
//  ViewController.swift
//  NetworkingList100
//
//  Created by Sergei Poluboiarinov on 2022-11-27.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var dataSource = [Post]()
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        networkManager.obtainPosts { [weak self] (result) in
            switch result {
            case .success(let posts):
                self?.dataSource = posts
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription )")
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        
        let post = dataSource[indexPath.row]
        
        cell.textLabel?.text = post.title
        
        cell.detailTextLabel?.text = post.body
        
        return cell
    }
}
