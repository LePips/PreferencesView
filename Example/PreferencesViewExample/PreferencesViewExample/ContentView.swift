import PreferencesView
import SwiftUI
import SwiftUIIntrospect

struct ContentView: View {
    
    @State
    private var isFullScreenCoverPresented = false
    
    @State
    private var isStatusBarHidden = false
    
    var body: some View {
        VStack {
            Button("Present full screen cover") {
                isFullScreenCoverPresented = true
            }
            
            Button("Hide status bar") {
                isStatusBarHidden.toggle()
            }
        }
        .introspect(.viewController, on: .iOS(.v17)) { viewController in
            
        }
        .fullScreenCover(isPresented: $isFullScreenCoverPresented) {
//            PreferencesView {
                SecondView()
                    .prefersHomeIndicatorAutoHidden(true)
//                    .supportedOrientations(.landscape)
//            }
            .ignoresSafeArea()
        }
//        .prefersStatusBarHidden(true, animation: .slide)
//        .supportedOrientations(.portrait)
    }
}

struct SecondView: View {
    
    @Environment(\.dismiss)
    private var dismiss
    
    @Environment(\.colorScheme)
    private var colorScheme
    
    var body: some View {
        ZStack {
            Color.black
            
            VStack {
                Text("I should be landscaped with the home bar auto hidden and edge gestures deferred")
                    .foregroundStyle(.white)
                
                Text("Color scheme: \(colorScheme == .light ? "Light" : "Dark")")
                    .foregroundStyle(.white)
                
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
        .ignoresSafeArea()
    }
}
