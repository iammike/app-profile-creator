import SwiftUI

struct SplashScreenView: View {
    @State private var isAnimating = false
    @State private var showTitle = false
    @State private var showSubtitle = false

    let onComplete: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 24) {
                // Animated film/profile icon
                ZStack {
                    // Outer glow
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [.red.opacity(0.3), .clear],
                                center: .center,
                                startRadius: 40,
                                endRadius: 100
                            )
                        )
                        .frame(width: 200, height: 200)
                        .scaleEffect(isAnimating ? 1.2 : 0.8)

                    // Film reel background
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color(red: 0.15, green: 0.15, blue: 0.15), Color(red: 0.1, green: 0.1, blue: 0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 120, height: 120)
                        .overlay(
                            Circle()
                                .stroke(
                                    LinearGradient(
                                        colors: [.red, .orange, .red],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 4
                                )
                        )

                    // Profile icon
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.red, .orange],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .scaleEffect(isAnimating ? 1.0 : 0.5)
                }
                .rotationEffect(.degrees(isAnimating ? 0 : -10))

                VStack(spacing: 12) {
                    // App title
                    Text("Profile Creator")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.white, .white.opacity(0.8)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .opacity(showTitle ? 1 : 0)
                        .offset(y: showTitle ? 0 : 20)

                    // Subtitle
                    Text("Create & Manage Profiles")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.white.opacity(0.6))
                        .opacity(showSubtitle ? 1 : 0)
                        .offset(y: showSubtitle ? 0 : 10)
                }
            }
        }
        .onAppear {
            // Start animations
            withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                isAnimating = true
            }

            withAnimation(.easeOut(duration: 0.5).delay(0.3)) {
                showTitle = true
            }

            withAnimation(.easeOut(duration: 0.5).delay(0.5)) {
                showSubtitle = true
            }

            // Complete after animations
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                onComplete()
            }
        }
    }
}

#Preview {
    SplashScreenView(onComplete: {})
}
