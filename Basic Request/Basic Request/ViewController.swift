//
//  ViewController.swift
//  Basic Request
//
//  Created by Sergei Poluboiarinov on 2022-11-16.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.getUsers { users in
            print("\(users.count) users")
        }
        
        APIManager.shared.getPosts { posts in
            print("\(posts.count) posts")
        }
        
        APIManager.shared.getAlbums { albums in
            print("\(albums.count) albums")
        }
    }
}
