import SwiftUI

struct PrefersHomeIndicatorAutoHiddenPreferenceKey: PreferenceKey {

    static var defaultValue: Bool = false

    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue() || value
    }
}

struct PreferredInterfaceOrientationForPresentationKey: PreferenceKey {

    static var defaultValue: UIInterfaceOrientation = .portrait

    static func reduce(value: inout UIInterfaceOrientation, nextValue: () -> UIInterfaceOrientation) {
        value = nextValue()
    }
}

struct PrefersStatusBarHiddenKey: PreferenceKey {
    
    static var defaultValue: Bool = true
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
//        value = nextValue()
    }
}

struct SupportedOrientationsPreferenceKey: PreferenceKey {

    static var defaultValue: UIInterfaceOrientationMask = .allButUpsideDown

    static func reduce(value: inout UIInterfaceOrientationMask, nextValue: () -> UIInterfaceOrientationMask) {
        value = nextValue()
    }
}
