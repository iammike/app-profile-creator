import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        return config
    }
}

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    var window: UIWindow?
    var hostingController: StatusBarHostingController<AnyView>?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let profileStore = ProfileStore()
        let rootView = AnyView(RootView().environmentObject(profileStore))

        let controller = StatusBarHostingController(rootView: rootView)
        self.hostingController = controller

        StatusBarManager.shared.setStyleHandler = { [weak controller] style in
            controller?.statusBarStyle = style
        }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}

class StatusBarManager {
    static let shared = StatusBarManager()
    var setStyleHandler: ((UIStatusBarStyle) -> Void)?

    private init() {}

    func setStyle(_ style: UIStatusBarStyle) {
        DispatchQueue.main.async {
            self.setStyleHandler?(style)
        }
    }
}

class StatusBarHostingController<Content: View>: UIHostingController<Content> {
    var statusBarStyle: UIStatusBarStyle = .lightContent {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        statusBarStyle
    }
}

struct RootView: View {
    @EnvironmentObject var profileStore: ProfileStore
    @State private var showSplash = true

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ContentView()
                .environmentObject(profileStore)
                .opacity(showSplash ? 0 : 1)

            if showSplash {
                SplashScreenView {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showSplash = false
                    }
                }
                .transition(.opacity)
            }
        }
    }
}

@main
struct ProfileCreatorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
    }
}
