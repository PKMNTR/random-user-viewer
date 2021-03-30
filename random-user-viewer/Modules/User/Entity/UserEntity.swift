//
//  UserEntity.swift
//  random-user-viewer
//
//  Created by Ricardo Ramirez on 29/03/21.
//

import Foundation

import Foundation

struct UserDataResponse: Codable {
    let results: [User]
}

struct User: Codable {
    let name: Name
    let location: Location
    let email: String
    let phone, cell: String
    let picture: Picture
}

struct Location: Codable {
    let street: Street
    let city, state, country: String
    let coordinates: Coordinates
}

struct Coordinates: Codable {
    let latitude, longitude: String
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

struct Name: Codable {
    let title, first, last: String
}

struct Picture: Codable {
    let large, medium, thumbnail: String
}
