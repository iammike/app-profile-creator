import SwiftUI

struct AddEditProfileView: View {
    let platform: StreamingPlatform
    let profile: Profile?

    @EnvironmentObject var profileStore: ProfileStore
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var selectedAvatar: String = ""
    @State private var isKidsProfile: Bool = false
    @State private var showingAvatarPicker = false

    private var isEditing: Bool { profile != nil }

    var body: some View {
        NavigationStack {
            ZStack {
                platform.backgroundColor
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 30) {
                        avatarSection
                        nameSection
                        kidsToggleSection
                        Spacer(minLength: 50)
                    }
                    .padding()
                }
            }
            .navigationTitle(isEditing ? "Edit Profile" : "Add Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(platform.backgroundColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.white)
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveProfile()
                    }
                    .foregroundStyle(platform.primaryColor)
                    .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
            .sheet(isPresented: $showingAvatarPicker) {
                AvatarPickerView(platform: platform, selectedAvatar: $selectedAvatar)
            }
            .onAppear {
                if let profile = profile {
                    name = profile.name
                    selectedAvatar = profile.avatar
                    isKidsProfile = profile.isKidsProfile
                } else {
                    selectedAvatar = platform.profileAvatars.first ?? "😀"
                }
            }
        }
    }

    private var avatarSection: some View {
        VStack(spacing: 16) {
            Button {
                showingAvatarPicker = true
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(platform.primaryColor.opacity(0.3))
                        .frame(width: 140, height: 140)

                    Text(selectedAvatar)
                        .font(.system(size: 70))

                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "pencil.circle.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(platform.primaryColor)
                                .background(Circle().fill(.white).padding(4))
                        }
                    }
                    .padding(8)
                }
                .frame(width: 140, height: 140)
            }

            Text("Tap to change avatar")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
        }
        .padding(.top, 20)
    }

    private var nameSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Name")
                .font(.headline)
                .foregroundStyle(.white)

            TextField("Enter name", text: $name)
                .textFieldStyle(.plain)
                .font(.title3)
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white.opacity(0.1))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(platform.primaryColor.opacity(0.5), lineWidth: 1)
                )
        }
        .padding(.horizontal)
    }

    private var kidsToggleSection: some View {
        Toggle(isOn: $isKidsProfile) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Kids Profile")
                    .font(.headline)
                    .foregroundStyle(.white)

                Text("This profile will only show content rated for children")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.6))
            }
        }
        .tint(platform.primaryColor)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.05))
        )
        .padding(.horizontal)
    }

    private func saveProfile() {
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        guard !trimmedName.isEmpty else { return }

        if let existingProfile = profile {
            var updatedProfile = existingProfile
            updatedProfile.name = trimmedName
            updatedProfile.avatar = selectedAvatar
            updatedProfile.isKidsProfile = isKidsProfile
            profileStore.updateProfile(updatedProfile)
        } else {
            let newProfile = Profile(
                name: trimmedName,
                avatar: selectedAvatar,
                isKidsProfile: isKidsProfile,
                platform: platform
            )
            profileStore.addProfile(newProfile)
        }

        dismiss()
    }
}

#Preview {
    AddEditProfileView(platform: .netflix, profile: nil)
        .environmentObject(ProfileStore())
}
