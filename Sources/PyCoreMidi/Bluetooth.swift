import CoreMIDI
import CoreAudioKit
import UIKit

func getRootWindow() -> UIWindow {
    UIApplication.shared.windows.first!
}

fileprivate class BTMIDICentralViewController: CABTMIDICentralViewController {
    var uiViewController: UIViewController?

    /// Called when subview area laid out
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(doneAction))
    }

    /// Dismiss view controller when done
    @objc public func doneAction() {
        uiViewController?.dismiss(animated: true, completion: nil)
    }
}



public func show_midibluetooth() {
    let window = getRootWindow()
    guard let root = window.rootViewController else { return }
    
    let bluetoothMIDIViewController = BTMIDICentralViewController()
    let navController = UINavigationController(rootViewController: bluetoothMIDIViewController)

    navController.modalPresentationStyle = .popover
    
    //let popC = navController.popoverPresentationController
    
    root.present(navController, animated: true)
    
    
}
    

