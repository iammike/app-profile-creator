import SwiftUI

struct PlatformLogoView: View {
    let platform: StreamingPlatform
    var size: LogoSize = .large

    enum LogoSize {
        case small, medium, large

        var fontSize: CGFloat {
            switch self {
            case .small: return 24
            case .medium: return 36
            case .large: return 48
            }
        }

        var plusSize: CGFloat {
            switch self {
            case .small: return 18
            case .medium: return 28
            case .large: return 36
            }
        }
    }

    var body: some View {
        switch platform {
        case .netflix:
            netflixLogo
        case .disneyPlus:
            disneyPlusLogo
        case .hulu:
            huluLogo
        case .amazonPrime:
            primeLogo
        case .hboMax:
            maxLogo
        case .appleTVPlus:
            appleTVLogo
        case .youtube:
            youtubeLogo
        case .peacock:
            peacockLogo
        case .spotify:
            spotifyLogo
        case .appleMusic:
            appleMusicLogo
        case .amazonMusic:
            amazonMusicLogo
        case .tidal:
            tidalLogo
        case .xbox:
            xboxLogo
        case .playstation:
            playstationLogo
        case .nintendo:
            nintendoLogo
        case .steam:
            steamLogo
        case .roblox:
            robloxLogo
        case .minecraft:
            minecraftLogo
        case .epicGames:
            epicGamesLogo
        case .eaPlay:
            eaPlayLogo
        case .youtubeKids:
            youtubeKidsLogo
        case .pbsKids:
            pbsKidsLogo
        case .nickJr:
            nickJrLogo
        case .disneyJunior:
            disneyJuniorLogo
        }
    }

    private var netflixLogo: some View {
        Text("NETFLIX")
            .font(.system(size: size.fontSize, weight: .black, design: .default))
            .tracking(2)
            .foregroundStyle(
                LinearGradient(
                    colors: [Color(red: 229/255, green: 9/255, blue: 20/255), Color(red: 180/255, green: 0, blue: 10/255)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .shadow(color: .red.opacity(0.5), radius: 10, x: 0, y: 0)
    }

    private var disneyPlusLogo: some View {
        HStack(spacing: 2) {
            Text("DISNEY")
                .font(.system(size: size.fontSize, weight: .bold, design: .serif))
                .italic()
            Text("+")
                .font(.system(size: size.plusSize, weight: .bold, design: .rounded))
                .offset(y: -size.fontSize * 0.15)
        }
        .foregroundStyle(
            LinearGradient(
                colors: [Color(red: 17/255, green: 60/255, blue: 207/255), Color(red: 100/255, green: 149/255, blue: 237/255)],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
    }

    private var huluLogo: some View {
        Text("hulu")
            .font(.system(size: size.fontSize, weight: .heavy, design: .rounded))
            .foregroundStyle(Color(red: 28/255, green: 231/255, blue: 131/255))
            .shadow(color: Color(red: 28/255, green: 231/255, blue: 131/255).opacity(0.6), radius: 8, x: 0, y: 0)
    }

    private var primeLogo: some View {
        VStack(spacing: -4) {
            Text("prime")
                .font(.system(size: size.fontSize * 0.7, weight: .medium, design: .default))
                .italic()
            Text("video")
                .font(.system(size: size.fontSize * 0.9, weight: .bold, design: .default))
        }
        .foregroundStyle(Color(red: 0/255, green: 168/255, blue: 225/255))
        .overlay(alignment: .bottomTrailing) {
            // Arrow smile under "prime"
            Image(systemName: "arrow.right")
                .font(.system(size: size.fontSize * 0.3, weight: .bold))
                .foregroundStyle(.orange)
                .offset(x: size.fontSize * 0.4, y: -size.fontSize * 0.5)
        }
    }

    private var maxLogo: some View {
        Text("max")
            .font(.system(size: size.fontSize * 1.2, weight: .black, design: .rounded))
            .foregroundStyle(
                LinearGradient(
                    colors: [Color(red: 150/255, green: 60/255, blue: 189/255), Color(red: 100/255, green: 100/255, blue: 220/255)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }

    private var appleTVLogo: some View {
        HStack(spacing: 4) {
            Image(systemName: "apple.logo")
                .font(.system(size: size.fontSize * 0.8, weight: .medium))
            Text("tv")
                .font(.system(size: size.fontSize, weight: .medium, design: .default))
            Text("+")
                .font(.system(size: size.plusSize, weight: .semibold))
                .offset(y: -size.fontSize * 0.1)
        }
        .foregroundStyle(.white)
    }

    private var xboxLogo: some View {
        HStack(spacing: 6) {
            Image(systemName: "xbox.logo")
                .font(.system(size: size.fontSize * 0.9, weight: .medium))
            Text("XBOX")
                .font(.system(size: size.fontSize * 0.8, weight: .bold, design: .default))
                .tracking(3)
        }
        .foregroundStyle(Color(red: 16/255, green: 124/255, blue: 16/255))
        .shadow(color: Color.green.opacity(0.4), radius: 8, x: 0, y: 0)
    }

    private var playstationLogo: some View {
        HStack(spacing: 4) {
            Image(systemName: "playstation.logo")
                .font(.system(size: size.fontSize, weight: .medium))
            Text("PlayStation")
                .font(.system(size: size.fontSize * 0.7, weight: .medium, design: .default))
        }
        .foregroundStyle(
            LinearGradient(
                colors: [Color(red: 0/255, green: 55/255, blue: 145/255), Color(red: 0/255, green: 120/255, blue: 200/255)],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
    }

    private var nintendoLogo: some View {
        Text("Nintendo")
            .font(.system(size: size.fontSize, weight: .bold, design: .rounded))
            .foregroundStyle(Color(red: 230/255, green: 0/255, blue: 18/255))
            .shadow(color: Color.red.opacity(0.4), radius: 6, x: 0, y: 0)
    }

    private var steamLogo: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color(red: 27/255, green: 40/255, blue: 56/255), Color(red: 60/255, green: 80/255, blue: 100/255)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: size.fontSize * 0.7, height: size.fontSize * 0.7)
                .overlay(
                    Image(systemName: "gear")
                        .font(.system(size: size.fontSize * 0.4, weight: .bold))
                        .foregroundStyle(.white)
                )
            Text("STEAM")
                .font(.system(size: size.fontSize * 0.8, weight: .bold, design: .default))
                .tracking(2)
        }
        .foregroundStyle(Color(red: 102/255, green: 192/255, blue: 244/255))
    }

    private var youtubeLogo: some View {
        HStack(spacing: 4) {
            RoundedRectangle(cornerRadius: size.fontSize * 0.15)
                .fill(Color.red)
                .frame(width: size.fontSize * 0.9, height: size.fontSize * 0.65)
                .overlay(
                    Image(systemName: "play.fill")
                        .font(.system(size: size.fontSize * 0.35))
                        .foregroundStyle(.white)
                )
            Text("YouTube")
                .font(.system(size: size.fontSize * 0.8, weight: .semibold, design: .default))
        }
        .foregroundStyle(.white)
    }

    private var peacockLogo: some View {
        HStack(spacing: 4) {
            Text("🦚")
                .font(.system(size: size.fontSize * 0.7))
                .accessibilityLabel("Peacock logo")
            Text("Peacock")
                .font(.system(size: size.fontSize * 0.8, weight: .bold, design: .default))
        }
        .foregroundStyle(
            LinearGradient(
                colors: [.yellow, .orange, .red, .purple, .blue, .green],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
    }

    private var spotifyLogo: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(Color(red: 30/255, green: 215/255, blue: 96/255))
                .frame(width: size.fontSize * 0.8, height: size.fontSize * 0.8)
                .overlay(
                    VStack(spacing: 2) {
                        ForEach(0..<3, id: \.self) { i in
                            RoundedRectangle(cornerRadius: 2)
                                .fill(.black)
                                .frame(width: size.fontSize * 0.4 - CGFloat(i) * 3, height: 2)
                                .rotationEffect(.degrees(-15))
                        }
                    }
                )
            Text("Spotify")
                .font(.system(size: size.fontSize * 0.8, weight: .bold, design: .default))
        }
        .foregroundStyle(Color(red: 30/255, green: 215/255, blue: 96/255))
    }

    private var appleMusicLogo: some View {
        HStack(spacing: 4) {
            Image(systemName: "applelogo")
                .font(.system(size: size.fontSize * 0.7))
            Text("Music")
                .font(.system(size: size.fontSize * 0.8, weight: .medium, design: .default))
        }
        .foregroundStyle(
            LinearGradient(
                colors: [Color(red: 252/255, green: 60/255, blue: 68/255), Color(red: 252/255, green: 100/255, blue: 168/255)],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
    }

    private var amazonMusicLogo: some View {
        VStack(spacing: -2) {
            Text("amazon")
                .font(.system(size: size.fontSize * 0.5, weight: .medium, design: .default))
                .italic()
            Text("music")
                .font(.system(size: size.fontSize * 0.7, weight: .bold, design: .default))
        }
        .foregroundStyle(Color(red: 37/255, green: 209/255, blue: 234/255))
    }

    private var tidalLogo: some View {
        Text("TIDAL")
            .font(.system(size: size.fontSize * 0.9, weight: .black, design: .default))
            .tracking(3)
            .foregroundStyle(.white)
    }

    private var robloxLogo: some View {
        HStack(spacing: 4) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(red: 226/255, green: 35/255, blue: 26/255))
                .frame(width: size.fontSize * 0.6, height: size.fontSize * 0.6)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .fill(.white)
                        .frame(width: size.fontSize * 0.25, height: size.fontSize * 0.25)
                        .offset(x: size.fontSize * 0.1, y: -size.fontSize * 0.1)
                )
            Text("Roblox")
                .font(.system(size: size.fontSize * 0.8, weight: .bold, design: .default))
        }
        .foregroundStyle(.white)
    }

    private var minecraftLogo: some View {
        Text("MINECRAFT")
            .font(.system(size: size.fontSize * 0.7, weight: .black, design: .default))
            .tracking(1)
            .foregroundStyle(Color(red: 86/255, green: 130/255, blue: 70/255))
            .shadow(color: Color(red: 60/255, green: 90/255, blue: 50/255), radius: 0, x: 2, y: 2)
    }

    private var epicGamesLogo: some View {
        HStack(spacing: 4) {
            Text("E")
                .font(.system(size: size.fontSize * 0.8, weight: .black, design: .default))
                .padding(.horizontal, 4)
                .background(Color.white)
                .foregroundStyle(.black)
            Text("EPIC GAMES")
                .font(.system(size: size.fontSize * 0.5, weight: .bold, design: .default))
                .tracking(2)
        }
        .foregroundStyle(.white)
    }

    private var eaPlayLogo: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(Color(red: 255/255, green: 75/255, blue: 0/255))
                .frame(width: size.fontSize * 0.7, height: size.fontSize * 0.7)
                .overlay(
                    Text("EA")
                        .font(.system(size: size.fontSize * 0.3, weight: .black))
                        .foregroundStyle(.white)
                )
            Text("PLAY")
                .font(.system(size: size.fontSize * 0.7, weight: .bold, design: .default))
                .tracking(2)
        }
        .foregroundStyle(.white)
    }

    private var youtubeKidsLogo: some View {
        HStack(spacing: 4) {
            RoundedRectangle(cornerRadius: size.fontSize * 0.15)
                .fill(Color.red)
                .frame(width: size.fontSize * 0.7, height: size.fontSize * 0.5)
                .overlay(
                    Image(systemName: "play.fill")
                        .font(.system(size: size.fontSize * 0.25))
                        .foregroundStyle(.white)
                )
            Text("YouTube")
                .font(.system(size: size.fontSize * 0.6, weight: .semibold))
            Text("Kids")
                .font(.system(size: size.fontSize * 0.6, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(colors: [.red, .orange, .yellow, .green, .blue], startPoint: .leading, endPoint: .trailing)
                )
        }
        .foregroundStyle(.black)
    }

    private var pbsKidsLogo: some View {
        HStack(spacing: 4) {
            Text("PBS")
                .font(.system(size: size.fontSize * 0.5, weight: .bold))
                .fixedSize()
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .background(Color(red: 62/255, green: 180/255, blue: 73/255))
                .foregroundStyle(.white)
            Text("KIDS")
                .font(.system(size: size.fontSize * 0.5, weight: .black, design: .rounded))
                .fixedSize()
                .foregroundStyle(Color(red: 62/255, green: 180/255, blue: 73/255))
        }
        .fixedSize()
    }

    private var nickJrLogo: some View {
        HStack(spacing: 2) {
            Text("nick")
                .font(.system(size: size.fontSize * 0.7, weight: .bold, design: .rounded))
            Text("jr.")
                .font(.system(size: size.fontSize * 0.7, weight: .black, design: .rounded))
        }
        .foregroundStyle(Color(red: 255/255, green: 128/255, blue: 0/255))
    }

    private var disneyJuniorLogo: some View {
        VStack(spacing: 0) {
            Text("Disney")
                .font(.system(size: size.fontSize * 0.5, weight: .bold, design: .serif))
                .italic()
            Text("JUNIOR")
                .font(.system(size: size.fontSize * 0.6, weight: .black, design: .rounded))
        }
        .foregroundStyle(Color(red: 113/255, green: 86/255, blue: 163/255))
    }
}

#Preview {
    VStack(spacing: 40) {
        ForEach(StreamingPlatform.allCases) { platform in
            PlatformLogoView(platform: platform)
        }
    }
    .padding()
    .background(Color.black)
}
