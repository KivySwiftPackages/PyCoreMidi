//
//  PyMidiListener.swift
//  PyCoreMidi
//
//  Created by CodeBuilder on 25/04/2025.
//

import AudioKit
import CoreMIDI
//import PythonCore
import PySwiftWrapper
import PySwiftObject
import PyCallable
import PySwiftKit
import PySerializing

@PyClass
@PyContainer
public final class PyMidiListener {
    
    @PyCall func on_note_on(channel: MIDIChannel, note: UInt8, velocity: MIDIByte, portID: MIDIUniqueID?)
    
    @PyCall func on_note_off(channel: MIDIChannel, note: UInt8, velocity: MIDIByte, portID: MIDIUniqueID?)
    
    @PyCall func on_cc(channel: MIDIChannel, controller: UInt8, value: MIDIByte, portID: MIDIUniqueID?)
    
    @PyCall func on_note_aftertouch(channel: MIDIChannel, note: MIDIByte, pressure: UInt8, portID: MIDIUniqueID?)
    
    @PyCall func on_aftertouch(channel: MIDIChannel, pressure: MIDIByte, portID: MIDIUniqueID?)
    
    
    @PyCall func on_pitch_wheel(channel: MIDIChannel, pitch: MIDIWord, portID: MIDIUniqueID?)
    
    @PyCall func on_program_change(channel: MIDIChannel, program: MIDIByte, portID: MIDIUniqueID?)
    
    @PyCall func on_sysex(data: [MIDIByte], portID: MIDIUniqueID?)

}



extension PyMidiListener: MIDIListener {
    public func receivedMIDINoteOn(noteNumber: AudioKit.MIDINoteNumber, velocity: AudioKit.MIDIVelocity, channel: AudioKit.MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        on_note_on(channel: channel, note: noteNumber, velocity: velocity, portID: portID)
    }
    
    public func receivedMIDINoteOff(noteNumber: AudioKit.MIDINoteNumber, velocity: AudioKit.MIDIVelocity, channel: AudioKit.MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        on_note_off(channel: channel, note: noteNumber, velocity: velocity, portID: portID)
    }
    
    public func receivedMIDIController(_ controller: AudioKit.MIDIByte, value: AudioKit.MIDIByte, channel: AudioKit.MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        on_cc(channel: channel, controller: controller, value: value, portID: portID)
    }
    
    public func receivedMIDIAftertouch(noteNumber: AudioKit.MIDINoteNumber, pressure: AudioKit.MIDIByte, channel: AudioKit.MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        on_note_aftertouch(channel: channel, note: noteNumber, pressure: pressure, portID: portID)
    }
    
    public func receivedMIDIAftertouch(_ pressure: AudioKit.MIDIByte, channel: AudioKit.MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        on_aftertouch(channel: channel, pressure: pressure, portID: portID)
    }
    
    public func receivedMIDIPitchWheel(_ pitchWheelValue: AudioKit.MIDIWord, channel: AudioKit.MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        on_pitch_wheel(channel: channel, pitch: pitchWheelValue, portID: portID)
    }
    
    public func receivedMIDIProgramChange(_ program: AudioKit.MIDIByte, channel: AudioKit.MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        on_program_change(channel: channel, program: program, portID: portID)
    }
    
    public func receivedMIDISystemCommand(_ data: [AudioKit.MIDIByte], portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        on_sysex(data: data, portID: portID)
    }
    
    public func receivedMIDISetupChange() {
        print("receivedMIDISetupChange")
        
    }
    
    public func receivedMIDIPropertyChange(propertyChangeInfo: MIDIObjectPropertyChangeNotification) {
       
    }
    
    public func receivedMIDINotification(notification: MIDINotification) {
        
    }
    
    
}


extension PyCast  {
    public static func cast(from object: PyPointer) throws -> PyMidiListener {
        guard
            PyObject_TypeCheck(object, PyMidiListener.PyType),
            let pointee = unsafeBitCast(object, to: PySwiftObjectPointer.self)?.pointee
        else { throw PyStandardException.typeError }
        
        return Unmanaged.fromOpaque(pointee.swift_ptr).takeUnretainedValue()
    }
}
