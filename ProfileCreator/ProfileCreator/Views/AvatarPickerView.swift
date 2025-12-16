import SwiftUI

struct AvatarPickerView: View {
    let platform: StreamingPlatform
    @Binding var selectedAvatar: String
    @Environment(\.dismiss) private var dismiss

    private let columns = [
        GridItem(.adaptive(minimum: 70, maximum: 90), spacing: 16)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                platform.backgroundColor
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Choose an Avatar")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                            .padding(.top)

                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(platform.profileAvatars, id: \.self) { avatar in
                                avatarButton(avatar)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
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
            }
        }
    }

    private func avatarButton(_ avatar: String) -> some View {
        Button {
            selectedAvatar = avatar
            dismiss()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(platform.primaryColor.opacity(selectedAvatar == avatar ? 0.5 : 0.2))
                    .frame(width: 70, height: 70)

                Text(avatar)
                    .font(.system(size: 35))
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        selectedAvatar == avatar ? platform.primaryColor : Color.clear,
                        lineWidth: 3
                    )
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AvatarPickerView(platform: .disneyPlus, selectedAvatar: .constant("🏰"))
}
