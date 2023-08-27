//
//  PostModel.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 20/08/2023.
//
import Foundation
import SwiftUI

struct PostModel: Identifiable {
    typealias ID = UUID
    let id: UUID = .init()
    let content: Optional<String>
    let attachement: Array<URL>
    var likes: Array<UserModel.ID>
    var replies: Array<PostModel.ID>
    let createdAt: Date
    let createdBy: UserModel.ID
}

