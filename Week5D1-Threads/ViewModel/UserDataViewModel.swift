//
//  UserDataViewModel.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 21/08/2023.
//
import Foundation
import SwiftUI

class UserDataViewModel: ObservableObject {
    @Published var posts: Array<PostModel> = []
    @Published var users: Array<UserModel> = []
    
    init() {
        // Prepare data
        
        // // Prepare Users
        let maxNumberOfUsers = 10
        for _ in 0..<maxNumberOfUsers{
            let firstAndLastName = makeRandomFullname()
            
            let fullname = "\(firstAndLastName[0]) \(firstAndLastName[1])"
            let username = "\(firstAndLastName [0]).\(firstAndLastName[1])".lowercased()
            let user = UserModel(username: username,
                                 fullname: fullname,
                                 bio: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                                 image: URL(string:
                                                "https://source.unsplash.com/100×100/?person"),
                                 followers: [],
                                 following: [],
                                 posts: []
            )
            users.append(user)
        }
        // Prepare posts
        let maxNumberOfPosts = maxNumberOfUsers * 5
        for _ in 0..<maxNumberOfPosts {
            let userId = users.randomElement ()!.id
            let post = PostModel(
                content: makeRandomContent(),
                attachement: makeRandomAttachment(),
                likes: [],
                replies: [],
                createdAt: Date() ,
                createdBy: userId
            )
            posts.append(post)
            
            // Linking currentPost to userPosts
            let index = users.firstIndex(where: { user in
                user.id == userId
            })
            if let index = index {
                users[index].posts.append(post.id)
            }
        }
        // Doing following/follower
        for _ in 0..<(maxNumberOfUsers * 4) {
            let user1Index = users.indices.randomElement ()!
            let user2Index = users.indices.randomElement ()!
            if user1Index != user2Index {
                let isNotFollowing = users[user1Index]
                    .following
                    .contains (users [user2Index].id) == false
                if isNotFollowing {
                    // User 1 following User 2
                    users[user1Index].following.append(users[user2Index].id)
                    // User 2 has new follower
                    users[user2Index].followers.append(users[user1Index].id)
                }
            }
        }
        //Doing liking
        for _ in 0..<(maxNumberOfPosts * 4) {
            let userIndex = users.indices.randomElement()!
            let postIndex = posts.indices.randomElement()!
            let isNotLiking  = posts[postIndex].likes
                .contains(users[userIndex].id) == false
            if isNotLiking {
                posts[postIndex].likes.append(users[userIndex].id)
            }
        }
        
    }
    func fetchUserById(_ userId: UserModel.ID) -> Optional<UserModel> {
        let index = users.firstIndex(where: { user in
            user.id == userId
        })
        if let index = index {
            return users[index]
        } else {
            return nil
        }
    }
    
    func fetchPostById(_ postId: PostModel.ID) -> Optional<PostModel> {
        let index = posts.firstIndex(where: { post in
            post.id == postId
        })
        if let index = index {
            return posts[index]
        } else {
            return nil
        }
    }
    func fetchData(){
        let numberOfPost = Int.random(in: 0...10)
        var arrayOfPost = Array <PostModel>()
        for _ in 0...numberOfPost {
            let  post = PostModel (
                content: makeRandomContent(),
                attachement: makeRandomAttachment(),
                likes:[], replies:[], createdAt: Date(), createdBy: UUID()
            )
            arrayOfPost.append(post)
            
        }
        posts = arrayOfPost
    }
    func makeRandomAttachment() -> Array<URL> {
        
        let numberOfImage = Int.random(in: 0...5)
        var arrayOFURLs = Array<URL>()
        for _ in 0...numberOfImage {
            arrayOFURLs.append(URL(string: "https://source.unsplash.com/250x150")!)
        }
        return arrayOFURLs
    }
    
    func makeRandomFullname() ->Array<String> {
        let name = """
oby Garner
Cali Curry
Aryan Martin
Monica Small
Paula Kent
Jaylin Mcmahon
Karissa Hartman
Wade Velasquez
Taylor Medina
Chase Cohen
Barbara Nielsen
Amy Mays
Jayvon Black
Peter Hart
Reid Nolan
Jade Solomon
Semaj Lewis
Pierre Moody
"""
            .components(separatedBy: "\n")
        return name.randomElement()!.components(separatedBy: " ")
    }
    func makeRandomContent() -> Optional<String> {
        let shouldContainContent = Bool.random()
        if shouldContainContent {
            return """

Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.

"""
        }
        return ""
    }
    
}
