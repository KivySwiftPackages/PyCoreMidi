import AudioKit
import CoreMIDI

class PyCoreMidi {
    
    private let midi = AudioKit.MIDI()
    
    init() {
        
    }
    
    
    func add_listener(listener: PyMidiListener) {
        midi.addListener(listener)
    }
    
    func remove_listener(listener: PyMidiListener) {
        midi.removeListener(listener)
    }
}


