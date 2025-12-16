import SwiftUI

struct ProfileCardView: View {
    let profile: Profile
    let isEditMode: Bool
    let onEdit: () -> Void
    let onDelete: () -> Void

    @State private var isPressed = false

    var body: some View {
        Button {
            if isEditMode {
                onEdit()
            }
        } label: {
            VStack(spacing: 12) {
                ZStack(alignment: .topTrailing) {
                    avatarView

                    if isEditMode {
                        editBadge
                    }
                }

                nameLabel
            }
        }
        .buttonStyle(ProfileButtonStyle())
        .overlay(alignment: .topLeading) {
            if isEditMode {
                deleteButton
            }
        }
    }

    private var avatarView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(profile.platform.primaryColor.opacity(0.3))
                .frame(width: 100, height: 100)

            Text(profile.avatar)
                .font(.system(size: 50))

            if profile.isKidsProfile {
                kidsIndicator
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isEditMode ? Color.white : Color.clear, lineWidth: 2)
        )
    }

    private var kidsIndicator: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("KIDS")
                    .font(.system(size: 8, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(profile.platform.primaryColor)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .padding(4)
            }
        }
    }

    private var editBadge: some View {
        Image(systemName: "pencil.circle.fill")
            .font(.system(size: 24))
            .foregroundStyle(profile.platform.primaryColor)
            .background(Circle().fill(.white).padding(4))
            .offset(x: 8, y: -8)
    }

    private var deleteButton: some View {
        Button {
            onDelete()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 24))
                .foregroundStyle(.white, .red)
        }
        .offset(x: -8, y: -8)
    }

    private var nameLabel: some View {
        Text(profile.name)
            .font(.subheadline)
            .foregroundStyle(.white.opacity(0.9))
            .lineLimit(1)
    }
}

struct ProfileButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.05 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ProfileCardView(
            profile: Profile(name: "Test", avatar: "😀", platform: .netflix),
            isEditMode: true,
            onEdit: {},
            onDelete: {}
        )
    }
}
