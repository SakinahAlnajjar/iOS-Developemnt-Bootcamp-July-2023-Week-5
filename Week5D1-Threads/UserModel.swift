//
//  UserModel.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 27/08/2023.
//


import Foundation
//import Foundation
struct UserModel: Identifiable {
    typealias ID = UUID
    let id: UUID = .init()
    var username: String
    var fullname: Optional<String>
    var bio: Optional<String>
    var image: Optional<URL>
    var followers: Array<UserModel.ID>
    var following: Array<UserModel.ID>
    var posts : Array<PostModel.ID>
}
