import SwiftUI

public extension View {
    
    func keyCommands(_ commands: [KeyCommandAction]) -> some View {
        preference(key: KeyCommandsPreferenceKey.self, value: commands)
    }
    
    func keyCommands(@KeyCommandsBuilder _ commands: @escaping () -> [KeyCommandAction]) -> some View {
        preference(key: KeyCommandsPreferenceKey.self, value: commands())
    }

    func prefersHomeIndicatorAutoHidden(_ hidden: Bool) -> some View {
        preference(key: PrefersHomeIndicatorAutoHiddenPreferenceKey.self, value: hidden)
    }

    func supportedOrientations(_ supportedOrientations: UIInterfaceOrientationMask) -> some View {
        preference(key: SupportedOrientationsPreferenceKey.self, value: supportedOrientations)
    }
}
