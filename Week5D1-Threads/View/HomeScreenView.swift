//
//  HomeScreenView.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 21/08/2023.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject  var userDate : UserDataViewModel
    var body: some View {
        ScrollView(showsIndicators: false){
            ForEach(userDate.posts) { post in
                if let user = userDate.fetchUserById(post.createdBy){
                    NavigationLink(
                        destination: {
                        PostScreenView(postModel: post,
                                       userModel: user)
                            
                    },label: { PostComponentView(postModel: post,
                                                 userModel: user)
                            
                        }
                    )
                    .buttonStyle(.plain)
                    Divider()
                }

            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
