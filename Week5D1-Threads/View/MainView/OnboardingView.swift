//
//  OnboardingView.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 20/08/2023.
//

import SwiftUI

struct OnboardingView: View {
    enum CurrentPresentedView {
        case authentication
        case mainView
    }
    @State var presentdView : CurrentPresentedView = .authentication
    // @State var presentdView2 : CurrentPresentedView = .mainView
    @EnvironmentObject var auth : AuthViewModel
    @EnvironmentObject var UserData : UserDataViewModel
    
    var body: some View {
        switch presentdView {
        case .authentication:
            VStack{
                Image("threads")
                    .resizable()
                    .scaledToFill()
                Spacer()
                Button (
                    action: {
                    if auth.signIn(UserData.users.randomElement()!.id){
                        presentdView = .mainView
                    }
                    else {
                        presentdView = .authentication
                    }
                },   label: {
                    Text("Sign in ")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.pink)
                        .cornerRadius(12)
                        .padding()
                        .foregroundColor(.white)
                }
                )
            }
            .onAppear {
                if auth.currentUserId.isEmpty == false {
                    presentdView = .mainView
                }
            }
        case .mainView:
            MainView()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

