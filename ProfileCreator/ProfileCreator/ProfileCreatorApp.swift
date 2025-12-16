import SwiftUI

@main
struct ProfileCreatorApp: App {
    @StateObject private var profileStore = ProfileStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(profileStore)
        }
    }
}
