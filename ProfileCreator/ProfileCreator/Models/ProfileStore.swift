import Foundation
import SwiftUI

@MainActor
class ProfileStore: ObservableObject {
    @Published var profiles: [Profile] = []

    private let saveKey = "savedProfiles"

    init() {
        loadProfiles()
    }

    func profiles(for platform: StreamingPlatform) -> [Profile] {
        profiles.filter { $0.platform == platform }
    }

    func addProfile(_ profile: Profile) {
        profiles.append(profile)
        saveProfiles()
    }

    func updateProfile(_ profile: Profile) {
        if let index = profiles.firstIndex(where: { $0.id == profile.id }) {
            profiles[index] = profile
            saveProfiles()
        }
    }

    func deleteProfile(_ profile: Profile) {
        profiles.removeAll { $0.id == profile.id }
        saveProfiles()
    }

    func deleteProfile(at offsets: IndexSet, for platform: StreamingPlatform) {
        let platformProfiles = profiles(for: platform)
        for offset in offsets {
            let profile = platformProfiles[offset]
            deleteProfile(profile)
        }
    }

    private func saveProfiles() {
        if let encoded = try? JSONEncoder().encode(profiles) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    private func loadProfiles() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Profile].self, from: data) {
            profiles = decoded
        }
    }
}
