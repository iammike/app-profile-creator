import SwiftUI

struct ProfileCardView: View {
    let profile: Profile
    let isEditMode: Bool
    let onSelect: () -> Void
    let onEdit: () -> Void
    let onDelete: () -> Void

    @State private var isAnimating = false
    @State private var showConfetti = false

    var body: some View {
        Button {
            if isEditMode {
                onEdit()
            } else {
                triggerSelectAnimation()
            }
        } label: {
            VStack(spacing: 0) {
                ZStack {
                    avatarView
                        .padding(.top, 12)
                        .padding(.horizontal, 12)
                }
                .overlay(alignment: .topLeading) {
                    Button {
                        onDelete()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.white, .red)
                    }
                    .opacity(isEditMode ? 1 : 0)
                }
                .overlay(alignment: .topTrailing) {
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 24))
                        .foregroundStyle(profile.platform.primaryColor)
                        .background(Circle().fill(.white).padding(4))
                        .opacity(isEditMode ? 1 : 0)
                }

                nameLabel
                    .padding(.top, 6)
            }
        }
        .buttonStyle(ProfileButtonStyle())
        .overlay {
            if showConfetti {
                ConfettiView(color: profile.platform.primaryColor)
            }
        }
        .scaleEffect(isAnimating ? 1.2 : 1.0)
    }

    private func triggerSelectAnimation() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
            isAnimating = true
            showConfetti = true
        }

        // Reset and call onSelect after animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation {
                isAnimating = false
                showConfetti = false
            }
            onSelect()
        }
    }

    private var avatarView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(profile.platform.primaryColor.opacity(0.3))
                .frame(width: 100, height: 100)

            avatarContent

            if profile.isKidsProfile {
                kidsIndicator
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isEditMode ? Color.white : Color.clear, lineWidth: 2)
        )
    }

    @ViewBuilder
    private var avatarContent: some View {
        switch profile.avatarType {
        case .emoji:
            Text(profile.avatarEmoji)
                .font(.system(size: 50))
        case .photo, .memoji:
            if let imageData = profile.avatarImageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            } else {
                Text(profile.avatarEmoji)
                    .font(.system(size: 50))
            }
        }
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

    private var nameLabel: some View {
        Text(profile.name)
            .font(.subheadline)
            .foregroundStyle(.white.opacity(0.9))
            .lineLimit(1)
    }
}

// Fun celebration animation
struct ConfettiView: View {
    let color: Color
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 1.0
    @State private var rotation: Double = 0

    private let emojis = ["🎉", "🎊", "✨", "⭐️", "🌟", "💫"]

    var body: some View {
        ZStack {
            ForEach(0..<6, id: \.self) { index in
                Text(emojis[index])
                    .font(.system(size: 24))
                    .offset(x: offsetX(for: index), y: offsetY(for: index))
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .rotationEffect(.degrees(rotation))
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                scale = 1.5
                rotation = 360
            }
            withAnimation(.easeOut(duration: 0.3).delay(0.4)) {
                opacity = 0
            }
        }
    }

    private func offsetX(for index: Int) -> CGFloat {
        let angle = Double(index) * 60.0 * .pi / 180.0
        return CGFloat(cos(angle)) * 60
    }

    private func offsetY(for index: Int) -> CGFloat {
        let angle = Double(index) * 60.0 * .pi / 180.0
        return CGFloat(sin(angle)) * 60
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
            isEditMode: false,
            onSelect: { print("Selected!") },
            onEdit: {},
            onDelete: {}
        )
    }
}
