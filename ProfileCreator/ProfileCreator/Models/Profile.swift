import Foundation
import SwiftUI

enum AvatarType: String, Codable {
    case emoji
    case photo
    case memoji
}

struct Profile: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var avatarType: AvatarType
    var avatarEmoji: String
    var avatarImageData: Data?
    var isKidsProfile: Bool
    let platform: StreamingPlatform
    let createdAt: Date

    init(
        id: UUID = UUID(),
        name: String,
        avatar: String,
        avatarType: AvatarType = .emoji,
        avatarImageData: Data? = nil,
        isKidsProfile: Bool = false,
        platform: StreamingPlatform,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.avatarEmoji = avatar
        self.avatarType = avatarType
        self.avatarImageData = avatarImageData
        self.isKidsProfile = isKidsProfile
        self.platform = platform
        self.createdAt = createdAt
    }

    // Backwards compatibility
    var avatar: String {
        get { avatarEmoji }
        set { avatarEmoji = newValue }
    }
}
