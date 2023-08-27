//
//  RootSceenView.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 22/08/2023.
//

import SwiftUI
/*
 mark
 -lunch screen.storyboard
 -make randomDate
 -make random content
 -enchance postcomponenetView vertical
 -line
 -update all headrer on main View
 -
 */
struct RootSceenView: View {
    var body: some View {
        let timer = Timer.TimerPublisher(interval: 2, runLoop: .main, mode: .default)
       
    }
}

struct RootSceenView_Previews: PreviewProvider {
    static var previews: some View {
        RootSceenView()
    }
}
