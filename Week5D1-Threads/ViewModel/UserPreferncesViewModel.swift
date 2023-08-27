//
//  UserSettingViewModel.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 20/08/2023.
//

import Foundation
import SwiftUI
class UserPreferencesViewModel: ObservableObject{
    @AppStorage("userSessionToken") var token: String = ""
}
