//
//  ThreadsCloneApp.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 21/08/2023.
//

import SwiftUI

@main
struct ThreadsCloneApp: App {
    @ObservedObject var userprefernces = UserPreferencesViewModel()
    @ObservedObject var auth = AuthViewModel()
    @ObservedObject var userData = UserDataViewModel()
    
    init() {
        auth.reset()
    }
    var body: some Scene {
        WindowGroup {
            //            NavigationView{
            RootView()
                .environmentObject(userprefernces)
                .environmentObject(auth)
                .environmentObject(userData)
        }
    }
}
