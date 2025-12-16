import Foundation

struct Profile: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var avatar: String
    var isKidsProfile: Bool
    let platform: StreamingPlatform
    let createdAt: Date

    init(id: UUID = UUID(), name: String, avatar: String, isKidsProfile: Bool = false, platform: StreamingPlatform, createdAt: Date = Date()) {
        self.id = id
        self.name = name
        self.avatar = avatar
        self.isKidsProfile = isKidsProfile
        self.platform = platform
        self.createdAt = createdAt
    }
}
