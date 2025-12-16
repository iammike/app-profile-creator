import SwiftUI

enum StreamingPlatform: String, CaseIterable, Identifiable, Codable {
    case netflix
    case disneyPlus
    case hulu
    case amazonPrime
    case hboMax
    case appleTVPlus

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .netflix: return "Netflix"
        case .disneyPlus: return "Disney+"
        case .hulu: return "Hulu"
        case .amazonPrime: return "Prime Video"
        case .hboMax: return "Max"
        case .appleTVPlus: return "Apple TV+"
        }
    }

    var iconName: String {
        switch self {
        case .netflix: return "play.rectangle.fill"
        case .disneyPlus: return "sparkles"
        case .hulu: return "leaf.fill"
        case .amazonPrime: return "shippingbox.fill"
        case .hboMax: return "film.fill"
        case .appleTVPlus: return "apple.logo"
        }
    }

    var primaryColor: Color {
        switch self {
        case .netflix: return Color(red: 229/255, green: 9/255, blue: 20/255)
        case .disneyPlus: return Color(red: 17/255, green: 60/255, blue: 207/255)
        case .hulu: return Color(red: 28/255, green: 231/255, blue: 131/255)
        case .amazonPrime: return Color(red: 0/255, green: 168/255, blue: 225/255)
        case .hboMax: return Color(red: 150/255, green: 60/255, blue: 189/255)
        case .appleTVPlus: return Color.gray
        }
    }

    var backgroundColor: Color {
        switch self {
        case .netflix: return Color(red: 20/255, green: 20/255, blue: 20/255)
        case .disneyPlus: return Color(red: 26/255, green: 29/255, blue: 41/255)
        case .hulu: return Color(red: 8/255, green: 8/255, blue: 8/255)
        case .amazonPrime: return Color(red: 15/255, green: 24/255, blue: 33/255)
        case .hboMax: return Color(red: 0/255, green: 0/255, blue: 0/255)
        case .appleTVPlus: return Color(red: 25/255, green: 25/255, blue: 25/255)
        }
    }

    var profileAvatars: [String] {
        switch self {
        case .netflix:
            return ["😀", "🦊", "🐼", "🦁", "🐸", "🦄", "🐱", "🐶", "🐵", "🦋", "🌟", "🎬"]
        case .disneyPlus:
            return ["🏰", "✨", "🧚", "🦸", "🐭", "🦆", "🧸", "👸", "🤴", "🦁", "🐠", "🌺"]
        case .hulu:
            return ["📺", "🎭", "🎪", "🎨", "🎯", "🎲", "🎸", "🎤", "🎧", "🎹", "🎻", "🎺"]
        case .amazonPrime:
            return ["📦", "🚀", "⭐️", "🎁", "🎄", "🎃", "🎉", "🎊", "🎈", "🎂", "🍿", "🎥"]
        case .hboMax:
            return ["🎬", "🎞️", "📽️", "🎥", "📺", "🎭", "🎪", "🎨", "🌃", "🏙️", "🦇", "👑"]
        case .appleTVPlus:
            return ["🍎", "📱", "💻", "⌚️", "🎧", "🎬", "📺", "🌟", "✨", "🎯", "🎪", "🎭"]
        }
    }
}
