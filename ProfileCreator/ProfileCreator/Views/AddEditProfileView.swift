import SwiftUI
import PhotosUI

struct AddEditProfileView: View {
    let platform: StreamingPlatform
    let profile: Profile?

    @EnvironmentObject var profileStore: ProfileStore
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var selectedAvatar: String = ""
    @State private var avatarType: AvatarType = .emoji
    @State private var avatarImageData: Data?
    @State private var isKidsProfile: Bool = false
    @State private var showingAvatarPicker = false
    @State private var showingPhotoPicker = false
    @State private var selectedPhotoItem: PhotosPickerItem?

    private var isEditing: Bool { profile != nil }

    private var textColor: Color {
        platform.useLightText ? .white : .black
    }

    private var secondaryTextColor: Color {
        platform.useLightText ? .white.opacity(0.6) : .black.opacity(0.5)
    }

    private var fieldBackgroundColor: Color {
        platform.useLightText ? Color.white.opacity(0.1) : Color.black.opacity(0.05)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                platform.backgroundColor
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 30) {
                        avatarSection
                        avatarTypeSelector
                        nameSection
                        if !platform.isKidsPlatform {
                            kidsToggleSection
                        }
                        Spacer(minLength: 50)
                    }
                    .padding()
                }
            }
            .navigationTitle(isEditing ? "Edit Profile" : "Add Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(platform.backgroundColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(platform.useLightText ? .dark : .light, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(textColor)
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
            .photosPicker(isPresented: $showingPhotoPicker, selection: $selectedPhotoItem, matching: .images)
            .onChange(of: selectedPhotoItem) { _, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        avatarImageData = data
                        avatarType = .photo
                    }
                }
            }
            .onAppear {
                if let profile = profile {
                    name = profile.name
                    selectedAvatar = profile.avatarEmoji
                    avatarType = profile.avatarType
                    avatarImageData = profile.avatarImageData
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
                if avatarType == .emoji {
                    showingAvatarPicker = true
                } else {
                    showingPhotoPicker = true
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(platform.primaryColor.opacity(0.3))
                        .frame(width: 140, height: 140)

                    avatarPreview

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

            Text(avatarTypeHint)
                .font(.caption)
                .foregroundStyle(secondaryTextColor)
        }
        .padding(.top, 20)
    }

    @ViewBuilder
    private var avatarPreview: some View {
        switch avatarType {
        case .emoji:
            Text(selectedAvatar)
                .font(.system(size: 70))
        case .photo, .memoji:
            if let imageData = avatarImageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Image(systemName: "photo")
                    .font(.system(size: 50))
                    .foregroundStyle(secondaryTextColor)
            }
        }
    }

    private var avatarTypeHint: String {
        switch avatarType {
        case .emoji: return "Tap to change emoji"
        case .photo, .memoji: return "Tap to change photo"
        }
    }

    private var avatarTypeSelector: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Avatar Type")
                .font(.headline)
                .foregroundStyle(textColor)

            HStack(spacing: 12) {
                avatarTypeButton(type: .emoji, icon: "face.smiling", label: "Emoji")
                avatarTypeButton(type: .photo, icon: "photo", label: "Photo")
            }
        }
        .padding(.horizontal)
    }

    private func avatarTypeButton(type: AvatarType, icon: String, label: String) -> some View {
        Button {
            withAnimation {
                avatarType = type
            }
            switch type {
            case .photo, .memoji:
                showingPhotoPicker = true
            case .emoji:
                showingAvatarPicker = true
            }
        } label: {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                Text(label)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(avatarType == type ? platform.primaryColor : fieldBackgroundColor)
            )
            .foregroundStyle(avatarType == type ? .white : textColor.opacity(0.7))
        }
    }

    private var nameSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Name")
                .font(.headline)
                .foregroundStyle(textColor)

            TextField("Enter name", text: $name)
                .textFieldStyle(.plain)
                .font(.title3)
                .foregroundStyle(textColor)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(fieldBackgroundColor)
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
                    .foregroundStyle(textColor)

                Text("This profile will only show content rated for children")
                    .font(.caption)
                    .foregroundStyle(secondaryTextColor)
            }
        }
        .tint(platform.primaryColor)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(fieldBackgroundColor)
        )
        .padding(.horizontal)
    }

    private func saveProfile() {
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        guard !trimmedName.isEmpty else { return }

        if let existingProfile = profile {
            var updatedProfile = existingProfile
            updatedProfile.name = trimmedName
            updatedProfile.avatarEmoji = selectedAvatar
            updatedProfile.avatarType = avatarType
            updatedProfile.avatarImageData = avatarImageData
            updatedProfile.isKidsProfile = isKidsProfile
            profileStore.updateProfile(updatedProfile)
        } else {
            let newProfile = Profile(
                name: trimmedName,
                avatar: selectedAvatar,
                avatarType: avatarType,
                avatarImageData: avatarImageData,
                isKidsProfile: platform.isKidsPlatform || isKidsProfile,
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
