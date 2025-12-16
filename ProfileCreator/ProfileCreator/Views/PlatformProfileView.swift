import SwiftUI

struct PlatformProfileView: View {
    let platform: StreamingPlatform
    @EnvironmentObject var profileStore: ProfileStore
    @State private var showingAddProfile = false
    @State private var editingProfile: Profile?
    @State private var isEditMode = false

    private var profiles: [Profile] {
        profileStore.profiles(for: platform)
    }

    var body: some View {
        ZStack {
            platform.backgroundColor
                .ignoresSafeArea()

            VStack(spacing: 30) {
                headerView

                if profiles.isEmpty {
                    emptyStateView
                } else {
                    profileGridView
                }

                Spacer()

                if !profiles.isEmpty {
                    editButton
                }
            }
            .padding()
        }
        .sheet(isPresented: $showingAddProfile) {
            AddEditProfileView(platform: platform, profile: nil)
        }
        .sheet(item: $editingProfile) { profile in
            AddEditProfileView(platform: platform, profile: profile)
        }
    }

    private var headerView: some View {
        VStack(spacing: 8) {
            Text("Who's Watching?")
                .font(.system(size: 34, weight: .medium))
                .foregroundStyle(.white)

            Text(platform.displayName)
                .font(.headline)
                .foregroundStyle(platform.primaryColor)
        }
        .padding(.top, 40)
    }

    private var emptyStateView: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.badge.plus")
                .font(.system(size: 80))
                .foregroundStyle(platform.primaryColor.opacity(0.5))

            Text("No profiles yet")
                .font(.title2)
                .foregroundStyle(.white.opacity(0.7))

            Button {
                showingAddProfile = true
            } label: {
                Label("Add Profile", systemImage: "plus")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(platform.primaryColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .frame(maxHeight: .infinity)
    }

    private var profileGridView: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 30) {
                ForEach(profiles) { profile in
                    ProfileCardView(profile: profile, isEditMode: isEditMode) {
                        editingProfile = profile
                    } onDelete: {
                        withAnimation {
                            profileStore.deleteProfile(profile)
                        }
                    }
                }

                if profiles.count < 5 {
                    addProfileButton
                }
            }
            .padding(.horizontal)
        }
    }

    private var gridColumns: [GridItem] {
        [GridItem(.adaptive(minimum: 120, maximum: 150), spacing: 20)]
    }

    private var addProfileButton: some View {
        Button {
            showingAddProfile = true
        } label: {
            VStack(spacing: 12) {
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 2)
                        .frame(width: 100, height: 100)

                    Image(systemName: "plus")
                        .font(.system(size: 40))
                        .foregroundStyle(.white.opacity(0.5))
                }

                Text("Add Profile")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
    }

    private var editButton: some View {
        Button {
            withAnimation {
                isEditMode.toggle()
            }
        } label: {
            Text(isEditMode ? "Done" : "Manage Profiles")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    PlatformProfileView(platform: .netflix)
        .environmentObject(ProfileStore())
}
