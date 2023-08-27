//
//  RootScreenView.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 22/08/2023.
//


import SwiftUI

struct RootScreenView: View {
  let timer = Timer
    .TimerPublisher(
      interval: 2,
      runLoop: .main,
      mode: .default
    )
    .autoconnect()

  @State var finishedLoadingSplashScreen: Bool = false
    
  var body: some View {
    if finishedLoadingSplashScreen {
      OnboardingView()
    } else {
      ZStack {
        Image(systemName: "at")
          .imageScale(.large)
          .foregroundColor(.accentColor)
        VStack {
          Spacer()
          Text("From Swift-Bootcamp")
        }
      }
      .onReceive(timer) { _ in
        timer.upstream.connect().cancel()
        finishedLoadingSplashScreen = true
      }
    }
  }
}
