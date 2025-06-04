import AudioKit
import CoreMIDI
import UIKit

import PySwiftWrapper
import PySwiftKit
import PySwiftObject
import PySerializing
import PyUnpack


@PyClass
public class PyMidi {
    
    private let midi = AudioKit.MIDI()
    
    init() {
    }
    // it can see that this var is getter only
    @PyProperty
    var output_names: [String] {
        midi.destinationNames
    }
    
    @PyProperty
    var input_names: [String] {
        midi.inputNames
    }

    
    @PyMethod
    func add_listener(listener: PyMidiListener) {
        midi.addListener(listener)
    }
    
    @PyMethod
    func remove_listener(listener: PyMidiListener) {
        midi.removeListener(listener)
    }
    
    @PyMethod
    func open_input(index: Int) {
        midi.openInput(index: index)
    }
    
    @PyMethod
    func open_output(index: Int) {
        midi.openOutput(index: index)
    }
}




@PyModule
public class PyCoremidi: PyModuleProtocol {
    
    public static var py_classes: [any AnyObject.Type] = [
        PyMidi.self,
        PyMidiListener.self
    ]
    
    @PyFunction
    public static func show_midibluetooth() {
        let window = getRootWindow()
        guard let root = window.rootViewController else { return }
        
        let bluetoothMIDIViewController = BTMIDICentralViewController()
        let navController = UINavigationController(rootViewController: bluetoothMIDIViewController)

        navController.modalPresentationStyle = .popover
        
        //let popC = navController.popoverPresentationController
        
        root.present(navController, animated: true)
    }
}

