import SwiftUI

struct ContentView: View {
    @EnvironmentObject var profileStore: ProfileStore
    @State private var selectedPlatform: StreamingPlatform = .netflix

    var body: some View {
        NavigationStack {
            PlatformProfileView(platform: selectedPlatform)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Menu {
                            ForEach(StreamingPlatform.allCases) { platform in
                                Button {
                                    selectedPlatform = platform
                                } label: {
                                    Label(platform.displayName, systemImage: platform.iconName)
                                }
                            }
                        } label: {
                            HStack {
                                Image(systemName: selectedPlatform.iconName)
                                Text(selectedPlatform.displayName)
                                Image(systemName: "chevron.down")
                            }
                            .foregroundStyle(selectedPlatform.primaryColor)
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProfileStore())
}
