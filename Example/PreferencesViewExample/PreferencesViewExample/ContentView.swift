import PreferencesView
import SwiftUI
import SwiftUIIntrospect

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
                    hideOtherViews.toggle()
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
        .supportedOrientations(hideOtherViews ? .landscapeLeft : .all)
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
