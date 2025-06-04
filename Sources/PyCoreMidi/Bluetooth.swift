import CoreMIDI
import CoreAudioKit
import CoreBluetooth
import UIKit

func getRootWindow() -> UIWindow {
    UIApplication.shared.windows.first!
}

class BTMIDICentralViewController: CABTMIDICentralViewController {
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




    

