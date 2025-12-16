import Foundation
import SwiftUI

@MainActor
class ProfileStore: ObservableObject {
    @Published var profiles: [Profile] = []

    private let saveKey = "savedProfiles"
    private let iCloud = NSUbiquitousKeyValueStore.default

    init() {
        // Listen for iCloud changes from other devices
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(iCloudDidChange),
            name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
            object: iCloud
        )

        // Sync with iCloud
        iCloud.synchronize()

        loadProfiles()
    }

    @objc private func iCloudDidChange(_ notification: Notification) {
        Task { @MainActor in
            loadProfiles()
        }
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

    func deleteAllProfiles() {
        profiles.removeAll()
        saveProfiles()
    }

    private func saveProfiles() {
        if let encoded = try? JSONEncoder().encode(profiles) {
            // Save to both UserDefaults (local backup) and iCloud
            UserDefaults.standard.set(encoded, forKey: saveKey)
            iCloud.set(encoded, forKey: saveKey)
            iCloud.synchronize()
        }
    }

    private func loadProfiles() {
        // Prefer iCloud data, fall back to local UserDefaults
        if let data = iCloud.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Profile].self, from: data) {
            profiles = decoded
        } else if let data = UserDefaults.standard.data(forKey: saveKey),
                  let decoded = try? JSONDecoder().decode([Profile].self, from: data) {
            profiles = decoded
            // Sync local data to iCloud
            saveProfiles()
        }
    }
}
