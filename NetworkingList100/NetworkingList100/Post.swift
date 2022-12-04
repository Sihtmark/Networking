//
//  Post.swift
//  Sample2
//
//  Created by Sergei Poluboiarinov on 12/11/2022.
//

import Foundation

struct Post: Codable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
//    enum codingKeys: String, CodingKey {
//        case userId
//        case postId = "id"
//        case title
//        case body
//    }
}
