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
//                    hideOtherViews.toggle()
                    isFullScreenCoverPresented = true
                } label: {
                    Text("Toggle Shmoggle")
                }
            }
            
            if hideOtherViews {
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
                    .preferredColorScheme(.dark)
                    .supportedOrientations(.landscape)
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
//            Color.black
            
            VStack {
                Text("I should be landscaped with the home bar auto hidden and edge gestures deferred")
//                    .foregroundStyle(.white)
                
                Text("Color scheme: \(colorScheme == .light ? "Light" : "Dark")")
//                    .foregroundStyle(.white)
                
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
        .ignoresSafeArea()
        .keyCommands {
            KeyCommandAction(title: "Fullscreen", input: "f", modifierFlags: .shift) {
                dismiss()
            }
        }
    }
}
