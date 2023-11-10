import PreferencesView
import SwiftUI

struct ContentView: View {
    
    @State
    private var isFullScreenCoverPresented = false
    
    @State
    private var isStatusBarHidden = false
    
    @State
    private var hideOtherViews = false
    
    var body: some View {
        VStack {
            
            ZStack {
                Color.red
                
                Button {
                    isFullScreenCoverPresented = true
                } label: {
                    Text("Toggle Shmoggle")
                }
            }
            
            if !hideOtherViews {
                Color.blue
                    .frame(height: 50)
                
                Color.green
                    .frame(height: 50)
            }
        }
        .keyCommands {
            KeyCommandAction(title: "Fullscreen View", subtitle: "Enter the fullscreen view.", input: "f", modifierFlags: .shift) {
                isFullScreenCoverPresented = true
            }
            
            KeyCommandAction(title: "Hide", input: "h", modifierFlags: .control) {
                withAnimation(.easeIn(duration: 0.3)) {
                    hideOtherViews.toggle()
                }
            }
        }
        .supportedOrientations(hideOtherViews ? .landscape : .all)
        .fullScreenCover(isPresented: $isFullScreenCoverPresented) {
            PreferencesView {
                SecondView()
            }
        }
    }
}

struct SecondView: View {
    
    @Environment(\.dismiss)
    private var dismiss
    
    @Environment(\.colorScheme)
    private var colorScheme
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("I should be landscape with the home bar auto hidden and edge gestures deferred")
                
                Text("Color scheme: \(colorScheme == .light ? "Light" : "Dark")")
                
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
        .supportedOrientations(.landscape)
        .prefersHomeIndicatorAutoHidden(true)
        .keyCommands {
            KeyCommandAction(title: "Dismiss", input: "f", modifierFlags: .shift) {
                dismiss()
            }
        }
    }
}
