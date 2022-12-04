//
//  Posts.swift
//  Basic Request
//
//  Created by Sergei Poluboiarinov on 2022-11-16.
//

import Foundation
//
//  Posts.swift
//  Basic Request
//
//  Created by Sergei Poluboiarinov on 2022-11-16.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Posts = [Post]
