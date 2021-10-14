import Foundation

//MARK: - UserElement Model
struct UserElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

//MARK: - Address Model
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

//MARK: - Geo Model
struct Geo: Codable {
    let lat, lng: String
}

//MARK: - Company Model
struct Company: Codable {
    let name, catchPhrase, bs: String
}

