; Remap Caps to Esc
Capslock::
Send {Esc}
return

; Assign Ctrl-Alt-R as a hotkey to restart the script.
^!r::
Reload
Q.popup("Quahke reloaded")
return

; Enable layers using Ctrl-Alt-E
^!e::
Q.Layers.__init__()
Q.popup("Quahke - Layers On")
return