//
//  ViewController.swift
//  NetworkingProject
//
//  Created by Sergei Poluboiarinov on 2022-11-16.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var dataSourse = [Profile]()
    var randomPicture = UIImage()
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    var profileManager: ProfileManageable = ProfileManager()
    var pictures = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        fetchImage()
        setupTableView()
    }

    private func setupTableView() {
        tableView.backgroundColor = .tintColor
//        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.reuseID)
        tableView.rowHeight = ProfileCell.rowHeight
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func fetchData() {
        profileManager.fetchProfile { result in
            switch result {
            case .success(let profiles):
                self.dataSourse = profiles
                self.dataSourse.shuffle()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(.serverError):
                print("Server Error")
            case .failure(.decodingError):
                print("Decoding Error")
            }
        }
    }
    
    private func fetchImage() {
        self.profileManager.fetchImage { result in
            switch result {
            case .success(let picture):
                self.randomPicture = picture
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(.serverError):
                print("Picture server error")
            case .failure(.decodingError):
                print("Decoding error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        let post = dataSourse[indexPath.row]
        var profileID: String {
            switch post.userId {
            case  1: return "Ab ovo usque ad mala."
            case  2: return "Ab uno disce omnes."
            case  3: return "Nox cogitationum mater."
            case  4: return "Pauca, sed bona."
            case  5: return "Quid ipse sis, non guid habearis, interest."
            case  6: return "Sine labore non erit panis in ore."
            case  7: return "Sola virtute armatus."
            case  8: return "Tristis est anima mea."
            case  9: return "Vetus amor non sentit robiginem."
            default: return "Ferrum natare doces."
            }
        }
        cell.imageView1.image = randomPicture
        cell.userIdLabel.text = profileID
        cell.idLabel.text = String(post.id)
        cell.titleLabel.text = post.title
        return cell
    }
}


