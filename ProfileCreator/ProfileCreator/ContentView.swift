import SwiftUI
import UIKit

struct ContentView: View {
    @EnvironmentObject var profileStore: ProfileStore
    @State private var selectedPlatform: StreamingPlatform?
    @State private var isTransitioning = false
    @State private var showingDeleteConfirmation = false
    @State private var deleteConfirmationText = ""

    var body: some View {
        ZStack {
            // Persistent black background to prevent white flash
            Color.black.ignoresSafeArea()

            if let platform = selectedPlatform {
                // Platform profile view
                NavigationStack {
                    PlatformProfileView(platform: platform)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                        selectedPlatform = nil
                                    }
                                } label: {
                                    HStack(spacing: 6) {
                                        Image(systemName: "chevron.left")
                                        Text("Services")
                                    }
                                    .foregroundStyle(platform.useLightText ? .white : .black.opacity(0.8))
                                }
                            }
                        }
                        .toolbarColorScheme(platform.useLightText ? .dark : .light, for: .navigationBar)
                }
                .transition(.opacity)
            } else {
                // Home screen with platform grid
                homeScreen
                    .transition(.opacity)
            }

            // Loading overlay during transitions
            if isTransitioning {
                loadingOverlay
            }
        }
        .onChange(of: selectedPlatform) { _, newPlatform in
            let style: UIStatusBarStyle = (newPlatform?.useLightText == false) ? .darkContent : .lightContent
            StatusBarManager.shared.setStyle(style)
        }
        .onAppear {
            StatusBarManager.shared.setStyle(.lightContent)
        }
    }

    private var homeScreen: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 40) {
                    // Header
                    VStack(spacing: 8) {
                        Image("HeaderIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                        Text("Profile Creator")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(.white)
                        Text("Choose a service")
                            .font(.title3)
                            .foregroundStyle(.white.opacity(0.6))
                    }
                    .padding(.top, 60)

                    // Streaming section
                    platformSection(title: "Streaming", platforms: StreamingPlatform.allCases.filter { !$0.isGamingPlatform && !$0.isMusicPlatform && !$0.isKidsPlatform })

                    // Music section
                    platformSection(title: "Music", platforms: StreamingPlatform.allCases.filter { $0.isMusicPlatform })

                    // Gaming section
                    platformSection(title: "Gaming", platforms: StreamingPlatform.allCases.filter { $0.isGamingPlatform })

                    // Kids section
                    platformSection(title: "Kids", platforms: StreamingPlatform.allCases.filter { $0.isKidsPlatform })

                    // Delete All Data button
                    if !profileStore.profiles.isEmpty {
                        Button {
                            showingDeleteConfirmation = true
                        } label: {
                            HStack(spacing: 8) {
                                Image(systemName: "trash")
                                Text("Delete All Data")
                            }
                            .font(.subheadline)
                            .foregroundStyle(.red.opacity(0.7))
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.red.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .padding(.top, 20)
                    }

                    Spacer(minLength: 40)
                }
            }
        }
        .sheet(isPresented: $showingDeleteConfirmation) {
            DeleteConfirmationView(
                isPresented: $showingDeleteConfirmation,
                onDelete: {
                    withAnimation {
                        profileStore.deleteAllProfiles()
                    }
                }
            )
            .presentationDetents([.height(280)])
            .presentationDragIndicator(.visible)
            .preferredColorScheme(.dark)
        }
    }

    private func platformSection(title: String, platforms: [StreamingPlatform]) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white.opacity(0.7))
                .padding(.horizontal, 24)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 16)], spacing: 16) {
                ForEach(platforms) { platform in
                    PlatformCard(platform: platform) {
                        selectPlatform(platform)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }

    private func selectPlatform(_ platform: StreamingPlatform) {
        isTransitioning = true

        // Brief loading animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                selectedPlatform = platform
                isTransitioning = false
            }
        }
    }

    private var loadingOverlay: some View {
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)

                Text("Loading...")
                    .font(.headline)
                    .foregroundStyle(.white.opacity(0.8))
            }
        }
        .transition(.opacity)
    }
}

struct PlatformCard: View {
    let platform: StreamingPlatform
    let onTap: () -> Void

    @State private var isPressed = false

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(platform.backgroundColor)
                    .frame(height: 100)
                    .overlay(
                        PlatformLogoView(platform: platform, size: .small)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(platform.primaryColor.opacity(0.5), lineWidth: 2)
                    )

                Text(platform.displayName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
            }
        }
        .buttonStyle(PlatformCardButtonStyle(color: platform.primaryColor))
    }
}

struct PlatformCardButtonStyle: ButtonStyle {
    let color: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
            .shadow(color: configuration.isPressed ? color.opacity(0.5) : .clear, radius: 10)
    }
}

struct DeleteConfirmationView: View {
    @Binding var isPresented: Bool
    let onDelete: () -> Void

    @State private var confirmationText = ""
    @FocusState private var isTextFieldFocused: Bool

    private let requiredText = "DELETE"

    var body: some View {
        VStack(spacing: 20) {
            Text("Delete All Data?")
                .font(.title2)
                .fontWeight(.bold)

            Text("This will permanently delete all profiles across all services. Type **\(requiredText)** to confirm.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            TextField("Type \(requiredText) to confirm", text: $confirmationText)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.characters)
                .focused($isTextFieldFocused)
                .padding(.horizontal)

            HStack(spacing: 16) {
                Button("Cancel") {
                    confirmationText = ""
                    isPresented = false
                }
                .buttonStyle(.bordered)

                Button("Delete") {
                    onDelete()
                    confirmationText = ""
                    isPresented = false
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .disabled(confirmationText.uppercased() != requiredText)
            }
        }
        .padding()
        .onAppear {
            isTextFieldFocused = true
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProfileStore())
}
