//
//  APIManager.swift
//  Basic Request
//
//  Created by Sergei Poluboiarinov on 2022-11-16.
//

import Foundation

enum APIType {
    case login
    case getUsers
    case getPosts
    case getAlbums
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var headers: [String: String] {
        switch self {
        case .login: return ["authToken": "12345"]
        default:     return [:]
        }
    }
    
    var path: String {
        switch self {
        case .login:     return "login"
        case .getUsers:  return "users"
        case .getPosts:  return "posts"
        case .getAlbums: return "albums"
        }
    }
    
    var requests: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        var request =  URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        switch self {
        case .login:
            request.httpMethod = "POST"
            return request
        default:
            request.httpMethod = "GET"
            return request
        }
    }
}

class APIManager {
    static let shared = APIManager()
    
    func getUsers(completion: @escaping (Users) -> Void) {
        let request = APIType.getUsers.requests
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data, let users = try? JSONDecoder().decode(Users.self, from: data) {
                completion(users)
            } else {
                completion([])
            }
        }
        task.resume()
    }
    
    func getPosts(completion: @escaping (Posts) -> Void) {
        let request = APIType.getPosts.requests
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data, let posts = try? JSONDecoder().decode(Posts.self, from: data) {
                completion(posts)
            } else {
                completion([])
            }
        }
        task.resume()
    }
    
    func getAlbums(completion: @escaping (Albums) -> Void) {
        let request = APIType.getAlbums.requests
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data, let albums = try? JSONDecoder().decode(Albums.self, from: data) {
                completion(albums)
            } else {
                completion([])
            }
        }
        task.resume()
    }
}
