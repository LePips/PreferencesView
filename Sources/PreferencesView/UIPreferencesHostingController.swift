import SwiftUI

public class UIPreferencesHostingController: UIHostingController<AnyView> {

    init<Content: View>(@ViewBuilder content: @escaping () -> Content) {
        let box = Box()
        let rootView = AnyView(
            content()
                .onPreferenceChange(PrefersHomeIndicatorAutoHiddenPreferenceKey.self) {
                    box.value?._prefersHomeIndicatorAutoHidden = $0
                }
                .onPreferenceChange(PrefersStatusBarHiddenKey.self) {
                    box.value?._prefersStatusBarHidden = $0
                }
                .onPreferenceChange(SupportedOrientationsPreferenceKey.self) {
                    box.value?._orientations = $0
                }
        )
        
        super.init(rootView: rootView)
        
        box.value = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Home Indicator Auto Hidden

    private var _prefersHomeIndicatorAutoHidden = false {
        didSet { setNeedsUpdateOfHomeIndicatorAutoHidden() }
    }

    public override var prefersHomeIndicatorAutoHidden: Bool {
        _prefersHomeIndicatorAutoHidden
    }

    // MARK: Orientation

    private var _orientations: UIInterfaceOrientationMask = .all

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        _orientations
    }
    
    private var _presentationOrientation: UIInterfaceOrientation = .portrait
    
    public override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        _presentationOrientation
    }
    
    public override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        .slide
    }
    
    private var _prefersStatusBarHidden: Bool = false
    
    public override var prefersStatusBarHidden: Bool {
        _prefersStatusBarHidden
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.view.layer.opacity = 0
//        
//        withAnimation(.linear(duration: 1)) {
//            self.view.layer.opacity = 1
//        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("View did appear")

    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("View will disappear")
    }
}
