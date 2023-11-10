import SwiftUI

public extension View {
    
    func interfaceOrientationPresentation(_ orientation: UIInterfaceOrientation) -> some View {
        preference(key: PreferredInterfaceOrientationForPresentationKey.self, value: orientation)
    }

    func prefersHomeIndicatorAutoHidden(_ hidden: Bool) -> some View {
        preference(key: PrefersHomeIndicatorAutoHiddenPreferenceKey.self, value: hidden)
    }
    
    func prefersStatusBarHidden(_ hidden: Bool, animation: UIStatusBarAnimation) -> some View {
        preference(key: PrefersStatusBarHiddenKey.self, value: hidden)
    }

    func supportedOrientations(_ supportedOrientations: UIInterfaceOrientationMask, presentationOrientation: UIInterfaceOrientation? = nil) -> some View {
        preference(key: SupportedOrientationsPreferenceKey.self, value: supportedOrientations)
    }
}
