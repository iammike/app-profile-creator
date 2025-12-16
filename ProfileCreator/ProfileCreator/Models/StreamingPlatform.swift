import SwiftUI

enum StreamingPlatform: String, CaseIterable, Identifiable, Codable {
    // Streaming (8)
    case netflix
    case disneyPlus
    case hulu
    case amazonPrime
    case hboMax
    case appleTVPlus
    case youtube
    case peacock
    // Music (4)
    case spotify
    case appleMusic
    case amazonMusic
    case tidal
    // Gaming (8)
    case xbox
    case playstation
    case nintendo
    case steam
    case roblox
    case minecraft
    case epicGames
    case eaPlay
    // Kids (4)
    case youtubeKids
    case pbsKids
    case nickJr
    case disneyJunior

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .netflix: return "Netflix"
        case .disneyPlus: return "Disney+"
        case .hulu: return "Hulu"
        case .amazonPrime: return "Prime Video"
        case .hboMax: return "Max"
        case .appleTVPlus: return "Apple TV+"
        case .youtube: return "YouTube"
        case .peacock: return "Peacock"
        case .spotify: return "Spotify"
        case .appleMusic: return "Apple Music"
        case .amazonMusic: return "Amazon Music"
        case .tidal: return "Tidal"
        case .xbox: return "Xbox"
        case .playstation: return "PlayStation"
        case .nintendo: return "Nintendo"
        case .steam: return "Steam"
        case .roblox: return "Roblox"
        case .minecraft: return "Minecraft"
        case .epicGames: return "Epic Games"
        case .eaPlay: return "EA Play"
        case .youtubeKids: return "YouTube Kids"
        case .pbsKids: return "PBS Kids"
        case .nickJr: return "Nick Jr"
        case .disneyJunior: return "Disney Junior"
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
        case .youtube: return "play.rectangle.fill"
        case .peacock: return "bird.fill"
        case .spotify: return "waveform"
        case .appleMusic: return "music.note"
        case .amazonMusic: return "music.note.list"
        case .tidal: return "waveform"
        case .xbox: return "gamecontroller.fill"
        case .playstation: return "gamecontroller.fill"
        case .nintendo: return "gamecontroller.fill"
        case .steam: return "gamecontroller.fill"
        case .roblox: return "cube.fill"
        case .minecraft: return "square.grid.3x3.fill"
        case .epicGames: return "gamecontroller.fill"
        case .eaPlay: return "gamecontroller.fill"
        case .youtubeKids: return "play.rectangle.fill"
        case .pbsKids: return "book.fill"
        case .nickJr: return "star.fill"
        case .disneyJunior: return "sparkles"
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
        case .youtube: return Color(red: 255/255, green: 0/255, blue: 0/255)
        case .peacock: return Color(red: 250/255, green: 184/255, blue: 47/255)
        case .spotify: return Color(red: 30/255, green: 215/255, blue: 96/255)
        case .appleMusic: return Color(red: 252/255, green: 60/255, blue: 68/255)
        case .amazonMusic: return Color(red: 37/255, green: 209/255, blue: 234/255)
        case .tidal: return Color(red: 0/255, green: 255/255, blue: 255/255)
        case .xbox: return Color(red: 16/255, green: 124/255, blue: 16/255)
        case .playstation: return Color(red: 0/255, green: 55/255, blue: 145/255)
        case .nintendo: return Color(red: 230/255, green: 0/255, blue: 18/255)
        case .steam: return Color(red: 27/255, green: 40/255, blue: 56/255)
        case .roblox: return Color(red: 226/255, green: 35/255, blue: 26/255)
        case .minecraft: return Color(red: 86/255, green: 130/255, blue: 70/255)
        case .epicGames: return Color(red: 0/255, green: 150/255, blue: 255/255)
        case .eaPlay: return Color(red: 255/255, green: 75/255, blue: 0/255)
        case .youtubeKids: return Color(red: 255/255, green: 0/255, blue: 0/255)
        case .pbsKids: return Color(red: 62/255, green: 180/255, blue: 73/255)
        case .nickJr: return Color(red: 255/255, green: 128/255, blue: 0/255)
        case .disneyJunior: return Color(red: 113/255, green: 86/255, blue: 163/255)
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
        case .youtube: return Color(red: 15/255, green: 15/255, blue: 15/255)
        case .peacock: return Color(red: 0/255, green: 0/255, blue: 0/255)
        case .spotify: return Color(red: 18/255, green: 18/255, blue: 18/255)
        case .appleMusic: return Color(red: 20/255, green: 20/255, blue: 20/255)
        case .amazonMusic: return Color(red: 15/255, green: 18/255, blue: 25/255)
        case .tidal: return Color(red: 0/255, green: 0/255, blue: 0/255)
        case .xbox: return Color(red: 16/255, green: 16/255, blue: 16/255)
        case .playstation: return Color(red: 0/255, green: 20/255, blue: 50/255)
        case .nintendo: return Color(red: 20/255, green: 20/255, blue: 20/255)
        case .steam: return Color(red: 23/255, green: 29/255, blue: 37/255)
        case .roblox: return Color(red: 20/255, green: 20/255, blue: 20/255)
        case .minecraft: return Color(red: 45/255, green: 45/255, blue: 45/255)
        case .epicGames: return Color(red: 18/255, green: 18/255, blue: 18/255)
        case .eaPlay: return Color(red: 15/255, green: 15/255, blue: 15/255)
        case .youtubeKids: return Color(red: 255/255, green: 255/255, blue: 255/255)
        case .pbsKids: return Color(red: 240/255, green: 248/255, blue: 240/255)
        case .nickJr: return Color(red: 255/255, green: 245/255, blue: 230/255)
        case .disneyJunior: return Color(red: 240/255, green: 235/255, blue: 250/255)
        }
    }

    var logoImageName: String {
        switch self {
        case .netflix: return "netflix-logo"
        case .disneyPlus: return "disney-logo"
        case .hulu: return "hulu-logo"
        case .amazonPrime: return "prime-logo"
        case .hboMax: return "max-logo"
        case .appleTVPlus: return "appletv-logo"
        case .youtube: return "youtube-logo"
        case .peacock: return "peacock-logo"
        case .spotify: return "spotify-logo"
        case .appleMusic: return "applemusic-logo"
        case .amazonMusic: return "amazonmusic-logo"
        case .tidal: return "tidal-logo"
        case .xbox: return "xbox-logo"
        case .playstation: return "playstation-logo"
        case .nintendo: return "nintendo-logo"
        case .steam: return "steam-logo"
        case .roblox: return "roblox-logo"
        case .minecraft: return "minecraft-logo"
        case .epicGames: return "epicgames-logo"
        case .eaPlay: return "eaplay-logo"
        case .youtubeKids: return "youtubekids-logo"
        case .pbsKids: return "pbskids-logo"
        case .nickJr: return "nickjr-logo"
        case .disneyJunior: return "disneyjunior-logo"
        }
    }

    var isGamingPlatform: Bool {
        switch self {
        case .xbox, .playstation, .nintendo, .steam, .roblox, .minecraft, .epicGames, .eaPlay:
            return true
        default:
            return false
        }
    }

    var isMusicPlatform: Bool {
        switch self {
        case .spotify, .appleMusic, .amazonMusic, .tidal:
            return true
        default:
            return false
        }
    }

    var isKidsPlatform: Bool {
        switch self {
        case .youtubeKids, .pbsKids, .nickJr, .disneyJunior:
            return true
        default:
            return false
        }
    }

    var useLightText: Bool {
        switch self {
        case .youtubeKids, .pbsKids, .nickJr, .disneyJunior:
            return false
        default:
            return true
        }
    }

    var profileAvatars: [String] {
        // Massive collection of kid-friendly avatars
        let animals = [
            // Farm animals
            "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯",
            "🦁", "🐮", "🐷", "🐸", "🐵", "🙈", "🙉", "🙊", "🐔", "🐧",
            "🐦", "🐤", "🐣", "🦆", "🦅", "🦉", "🦇", "🐺", "🐗", "🐴",
            "🦄", "🐝", "🐛", "🦋", "🐌", "🐞", "🐜", "🦗", "🕷️", "🦂",
            // Sea creatures
            "🐢", "🐍", "🦎", "🦖", "🦕", "🐙", "🦑", "🦐", "🦞", "🦀",
            "🐡", "🐠", "🐟", "🐬", "🐳", "🐋", "🦈", "🐊", "🐅", "🐆",
            // More animals
            "🦓", "🦍", "🦧", "🐘", "🦛", "🦏", "🐪", "🐫", "🦒", "🦘",
            "🦬", "🐃", "🐂", "🐄", "🐎", "🐖", "🐏", "🐑", "🦙", "🐐",
            "🦌", "🐕", "🐩", "🦮", "🐈", "🐓", "🦃", "🦤", "🦚", "🦜",
            "🦢", "🦩", "🕊️", "🐇", "🦝", "🦨", "🦡", "🦫", "🦦", "🦥",
            "🐁", "🐀", "🐿️", "🦔"
        ]

        let food = [
            // Fruits
            "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈",
            "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🥦",
            // Sweets
            "🧁", "🍰", "🎂", "🍮", "🍭", "🍬", "🍫", "🍩", "🍪", "🌈",
            "🍦", "🍨", "🍧", "🥧", "🧇", "🥞", "🍿", "🥤", "🧃", "🧋",
            // Fun food
            "🍕", "🍔", "🍟", "🌭", "🥪", "🌮", "🌯", "🥗", "🍜", "🍝"
        ]

        let nature = [
            // Plants & flowers
            "🌸", "💮", "🏵️", "🌹", "🥀", "🌺", "🌻", "🌼", "🌷", "🌱",
            "🪴", "🌲", "🌳", "🌴", "🌵", "🌾", "🌿", "☘️", "🍀", "🍁",
            "🍂", "🍃", "🪻", "🪷", "💐", "🌰", "🎄", "🪹", "🪺",
            // Weather & sky
            "🌈", "⭐", "🌟", "✨", "💫", "⚡", "☀️", "🌙", "🌛", "🌜",
            "🌝", "🌞", "🪐", "💥", "🔥", "🌊", "💧", "💦", "❄️", "☃️",
            "⛄", "🌀", "🌪️", "🌤️", "⛅", "🌥️", "🌦️", "🌧️", "🌨️", "🌩️"
        ]

        let vehicles = [
            "🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐",
            "🛻", "🚚", "🚛", "🚜", "🛵", "🏍️", "🚲", "🛴", "🛹", "🛼",
            "🚁", "🛸", "🚀", "✈️", "🛩️", "🛫", "🛬", "🚂", "🚃", "🚄",
            "🚅", "🚆", "🚇", "🚈", "🚉", "🚊", "🚝", "🚞", "🛳️", "⛵",
            "🚤", "🛥️", "🛶", "⛴️", "🚢", "⚓", "🚧", "⛽", "🚏", "🚦"
        ]

        let sports = [
            "⚽", "🏀", "🏈", "⚾", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱",
            "🪀", "🏓", "🏸", "🏒", "🏑", "🥍", "🏏", "🪃", "🥅", "⛳",
            "🪁", "🏹", "🎣", "🤿", "🥊", "🥋", "🎽", "🛷", "⛸️", "🥌",
            "🎿", "⛷️", "🏂", "🪂", "🏋️", "🤸", "🤺", "🏄", "🚣", "🧗",
            "🏊", "🤽", "🚴", "🏇", "🎯", "🎮", "🕹️", "🎲", "♟️", "🎰"
        ]

        let fantasy = [
            "🦄", "🐉", "🧙", "🧙‍♀️", "🧙‍♂️", "🧚", "🧚‍♀️", "🧚‍♂️", "🧛", "🧜",
            "🧜‍♀️", "🧜‍♂️", "🧝", "🧝‍♀️", "🧝‍♂️", "🧞", "🧞‍♀️", "🧞‍♂️", "🧟", "👻",
            "👽", "👾", "🤖", "🎃", "💀", "☠️", "👹", "👺", "🤡", "👿",
            "😈", "💩", "🦸", "🦸‍♀️", "🦸‍♂️", "🦹", "🦹‍♀️", "🦹‍♂️", "🥷", "🧑‍🚀",
            "👸", "🤴", "🤠", "🥳", "😎", "🤩", "😻", "🙀", "😺", "😸"
        ]

        let objects = [
            "🎨", "🖼️", "🎭", "🎪", "🎠", "🎡", "🎢", "🎬", "🎤", "🎧",
            "🎹", "🥁", "🎷", "🎺", "🎸", "🪕", "🎻", "🪗", "🎵", "🎶",
            "🎙️", "📻", "📺", "📷", "📸", "🔭", "🔬", "💎", "💍", "👑",
            "🎀", "🧸", "🪆", "🪅", "🎁", "🎈", "🎉", "🎊", "🪩", "🏆",
            "🥇", "🥈", "🥉", "🏅", "🎖️", "📱", "💻", "🖥️", "🕹️", "📚"
        ]

        let faces = [
            "😀", "😃", "😄", "😁", "😆", "😅", "🤣", "😂", "🙂", "🙃",
            "😉", "😊", "😇", "🥰", "😍", "🤩", "😘", "😗", "😚", "😙",
            "🥲", "😋", "😛", "😜", "🤪", "😝", "🤑", "🤗", "🤭", "🤫",
            "🤔", "🤐", "🤨", "😐", "😑", "😶", "😏", "😒", "🙄", "😬",
            "🤯", "😳", "🥺", "😱", "😨", "😰", "😥", "😢", "😭", "😤"
        ]

        let gaming = [
            "🎮", "🕹️", "👾", "🎯", "🏆", "🥇", "🥈", "🥉", "🏅", "⚔️",
            "🛡️", "🗡️", "🔫", "💣", "🧨", "🎪", "🎰", "🎲", "♟️", "🃏",
            "🀄", "🎴", "🎭", "🎨", "🖼️", "🎬", "🎤", "🎧", "🎵", "🎶",
            "🚀", "🛸", "🌟", "⭐", "✨", "💫", "🔥", "💥", "⚡", "❄️"
        ]

        let music = [
            "🎵", "🎶", "🎤", "🎧", "🎹", "🥁", "🎷", "🎺", "🎸", "🪕",
            "🎻", "🪗", "🎙️", "📻", "🔊", "🔉", "🔈", "📀", "💿", "🎼",
            "🎚️", "🎛️", "🪇", "🪘", "🎺", "🪈", "🎵", "🎶", "🎤", "🎧"
        ]

        // Each platform gets a themed subset plus shared favorites
        switch self {
        case .netflix:
            return Array(faces.prefix(20)) + Array(animals.prefix(30)) + Array(fantasy.prefix(20)) + Array(food.prefix(15)) + Array(objects.prefix(15))
        case .disneyPlus:
            return Array(fantasy) + Array(animals.prefix(40)) + Array(nature.prefix(20)) + Array(faces.prefix(15)) + ["🏰", "👸", "🤴", "🧚", "✨", "🪄", "🎠", "🎡"]
        case .hulu:
            return Array(faces.prefix(25)) + Array(food.prefix(30)) + Array(nature.prefix(20)) + Array(objects.prefix(20)) + Array(animals.prefix(15))
        case .amazonPrime:
            return Array(vehicles) + Array(sports.prefix(30)) + Array(objects.prefix(25)) + Array(animals.prefix(20)) + Array(faces.prefix(15))
        case .hboMax:
            return Array(fantasy.prefix(25)) + Array(objects.prefix(30)) + Array(nature.prefix(20)) + Array(animals.prefix(20)) + Array(faces.prefix(15))
        case .appleTVPlus:
            return Array(nature.prefix(30)) + Array(animals.prefix(30)) + Array(faces.prefix(20)) + Array(objects.prefix(20)) + ["🍎", "📱", "💻", "⌚", "🎧", "🎬"]
        case .youtube:
            return Array(faces.prefix(30)) + Array(gaming.prefix(20)) + Array(objects.prefix(25)) + Array(animals.prefix(20)) + ["▶️", "🔴", "📺", "🎬"]
        case .peacock:
            return Array(animals.prefix(35)) + Array(nature.prefix(25)) + Array(faces.prefix(20)) + Array(fantasy.prefix(15)) + ["🦚", "🪶", "💛", "💜"]
        case .spotify:
            return Array(music) + Array(faces.prefix(25)) + Array(animals.prefix(20)) + Array(nature.prefix(15)) + ["💚", "🟢", "🎵", "🎶"]
        case .appleMusic:
            return Array(music) + Array(faces.prefix(25)) + Array(nature.prefix(20)) + Array(animals.prefix(15)) + ["🍎", "❤️", "🎵", "🎶"]
        case .amazonMusic:
            return Array(music) + Array(faces.prefix(25)) + Array(objects.prefix(20)) + Array(animals.prefix(15)) + ["💙", "🎵", "🎶", "🔊"]
        case .tidal:
            return Array(music) + Array(nature.prefix(25)) + Array(faces.prefix(20)) + Array(animals.prefix(15)) + ["🌊", "💎", "🎵", "🎶"]
        case .xbox:
            return Array(gaming) + Array(fantasy.prefix(30)) + Array(sports.prefix(25)) + Array(faces.prefix(20)) + ["💚", "🟢", "🎮", "🕹️"]
        case .playstation:
            return Array(gaming) + Array(fantasy.prefix(30)) + Array(vehicles.prefix(20)) + Array(faces.prefix(20)) + ["💙", "🔵", "🔷", "🎮"]
        case .nintendo:
            return Array(animals.prefix(40)) + Array(fantasy.prefix(30)) + Array(gaming.prefix(20)) + Array(faces.prefix(20)) + ["❤️", "🍄", "⭐", "🌟"]
        case .steam:
            return Array(gaming) + Array(fantasy.prefix(25)) + Array(vehicles.prefix(20)) + Array(objects.prefix(20)) + Array(faces.prefix(15))
        case .roblox:
            return Array(gaming) + Array(fantasy.prefix(30)) + Array(faces.prefix(25)) + Array(objects.prefix(15)) + ["🔴", "⬛", "🧱", "🎮"]
        case .minecraft:
            return Array(animals.prefix(35)) + Array(nature.prefix(30)) + Array(fantasy.prefix(20)) + Array(food.prefix(15)) + ["🟫", "🟩", "⛏️", "🧱", "💎", "🐷"]
        case .epicGames:
            return Array(gaming) + Array(fantasy.prefix(25)) + Array(faces.prefix(25)) + Array(sports.prefix(15)) + ["🎯", "🏆", "⚡", "🔵"]
        case .eaPlay:
            return Array(sports) + Array(gaming.prefix(25)) + Array(vehicles.prefix(20)) + Array(faces.prefix(20)) + ["⚽", "🏈", "🎮", "🏆"]
        case .youtubeKids:
            return Array(animals) + Array(faces.prefix(30)) + Array(food.prefix(20)) + Array(nature.prefix(15)) + ["▶️", "🔴", "🌈", "⭐"]
        case .pbsKids:
            return Array(animals) + Array(nature.prefix(30)) + Array(faces.prefix(20)) + Array(food.prefix(15)) + ["📚", "🌈", "🎨", "✏️"]
        case .nickJr:
            return Array(animals.prefix(40)) + Array(faces.prefix(30)) + Array(food.prefix(20)) + Array(fantasy.prefix(15)) + ["🧡", "⭐", "🌟", "🎈"]
        case .disneyJunior:
            return Array(animals) + Array(fantasy.prefix(30)) + Array(faces.prefix(25)) + Array(nature.prefix(15)) + ["💜", "✨", "🏰", "🌟"]
        }
    }
}
