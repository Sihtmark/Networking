//
//  ProfileManager.swift
//  NetworkingProject
//
//  Created by Sergei Poluboiarinov on 2022-11-16.
//

import Foundation
import UIKit

protocol ProfileManageable: AnyObject {
    func fetchProfile(completion: @escaping(Result<[Profile],NetworkError>) -> Void)
    func fetchImage(completion: @escaping(Result<UIImage,NetworkError>) -> Void)
}

enum NetworkError: Error {
    case serverError
    case decodingError
}

struct Profile: Codable {
    let userId: Int
    let id: Int
    let title: String
}

struct Image {
    let imageView: UIImageView
}

class ProfileManager: ProfileManageable {
    
    func fetchProfile(completion: @escaping (Result<[Profile], NetworkError>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/albums")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                
                do {
                    let profiles = try JSONDecoder().decode([Profile].self, from: data)
                    completion(.success(profiles))
                } catch {
                    completion(.failure(.decodingError))
                }
        }.resume()
    }
    
    func fetchImage(completion: @escaping (Result<UIImage,NetworkError>) -> Void) {
        let url = URL(string: "https://picsum.photos/300/200")!
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                guard let picture = UIImage(data: data) else {
                    completion(.failure(.decodingError))
                    return
                }
                completion(.success(picture))
            }.resume()
    }
}


