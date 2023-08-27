import SwiftUI

struct RootView: View {
    @EnvironmentObject var userPreferences: UserPreferencesViewModel
    var body: some View {
        
        OnboardingView()
        
    
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
