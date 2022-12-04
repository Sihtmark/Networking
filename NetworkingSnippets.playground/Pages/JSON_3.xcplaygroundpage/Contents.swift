import UIKit
import Foundation

// MARK: JSON > Swift
let json = """
{
"type": "US Robotics",
"model": "Sportster"
}
"""
struct Modem: Codable {
    let type: String
    let model: String
}
let result = try! JSONDecoder().decode(Modem.self, from: json.data(using: .utf8)!)


// MARK: Swift > JSON
var modem = Modem(type: "Hayes", model: "5611")
let jsonData2 = try! JSONEncoder().encode(modem)
let json2 = String(data: jsonData2, encoding: .utf8)!


// MARK: Coding keys
// Use these for when the JSON and Swift property names are different
struct User: Codable {
    var firstName: String
    var lastName: String
    var country: String

    enum Codingkeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case country
    }
}

let jsonUser = """
{
"first_name": "John",
"last_name": "Doe",
"country": "United_Kingdom"
}
"""

let userResult = try? JSONDecoder().decode(User.self, from: jsonUser.data(using: .utf8)!)


// MARK: Codable Types
// URL, Number, Bool, Array, Dictionary, Enum, Date, Null, and all other custom Codable types
let newJson = """
{
"name": "The Witcher",
"seasons": 1,
"rate": 9.3,
"favorite": null,
"genres": ["Animation", "Comedy", "Drama"],
"countries":{"Canada":"CA", "United States":"USA"},
"platform":{
"name": "Netflix",
"ceo": "Reed Hastings"
},
"mobile": "ios",
"url":"https://en.wikipedia.org/wiki/BoJack_Horseman"
}
"""
struct NewShow: Decodable {
    let name: String
    let seasons: Int
    let rate: Float
    let favorite: Bool?
    let genres: [String]
    let countries: Dictionary<String, String>
    let platform: Platform
    let mobile: Mobile
    let url: URL
    
    struct Platform: Decodable {
        let name: String
        let ceo: String
    }
    
    enum Mobile: String, Codable {
        case ios
        case android
    }
}

let newResult = try! JSONDecoder().decode(NewShow.self, from: newJson.data(using: .utf8)!)
newResult.platform.ceo
newResult.mobile


// MARK: - DATES


// MARK: Milliseconds
// If milliseconds - nothing to do
let jsonMS = """
{
"date": 519751611.12542897
}
"""

struct DateRecord : Codable {
    let date: Date
}

let msResult = try! JSONDecoder().decode(DateRecord.self, from: jsonMS.data(using: .utf8)!)
msResult.date


// MARK: ISO8601
// If iso8601 use dateEncodingStrategy

let jsonIso = """
{
"date": "2017-06-21T15:29:32Z"
}
"""
let isoDecoder = JSONDecoder()
isoDecoder.dateDecodingStrategy = .iso8601
let isoResult = try! isoDecoder.decode(DateRecord.self, from: jsonIso.data(using: .utf8)!)




