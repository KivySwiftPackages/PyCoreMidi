from swift_tools.swift_types import *
from typing import Optional


@wrapper(new=True)
class PyMidiListener:

    #def __init__(self, callback: object): ...
    
    class Callbacks:
        def on_note_on(self, channel: uint8, note: uint8, velocity: uint8, portID: Optional[int32]):
            pass

        def on_note_off(self, channel: uint8, note: uint8, velocity: uint8, portID: Optional[int32]):
            pass

        def on_aftertouch(self, channel: uint8, pressure: uint8, portID: Optional[int32]):
            pass
        
        def on_note_aftertouch(self, channel: uint8, note: uint8, pressure: uint8, portID: Optional[int32]):
            pass

        def on_cc(self, channel: uint8, controller: uint8, value: uint8, portID: Optional[int32]):
            pass
    
        def on_program_change(self, channel: uint8, program: uint8, portID: Optional[int32]):
            pass
        
        def on_pitch_wheel(self, channel: uint8, pitch: uint16, portID: Optional[int32]):
            pass
        
        def on_sysex(self, data: list[uint8], portID: Optional[int32]):
            pass
        
        def on_setup_change(self):
            pass

@wrapper
class PyCoreMidi:
    
    def __init__(self): ...
    
    def add_listener(self, listener: PyMidiListener):
        pass
    def remove_listener(self, listener: PyMidiListener):
        pass


def show_midibluetooth(): ...
