//
//  Week5D1_ThreadsApp.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 20/08/2023.
//

import SwiftUI

@main
struct Week5Day1ThreadsApp: App {
    @ObservedObject var userprefernces = UserPreferencesViewModel()
    @ObservedObject var auth = AuthViewModel()
    @ObservedObject var userData = UserDataViewModel()
    
    init() {
        auth.reset()
    }
    var body: some Scene {
        WindowGroup {
            //            NavigationView{
            RootScreenView()
                .environmentObject(userprefernces)
                .environmentObject(auth)
                .environmentObject(userData)
        }
        //        }
    }
}
