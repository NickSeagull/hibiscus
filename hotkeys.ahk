; Remap Caps to Esc
Capslock::
Send {Esc}
return

; Assign Ctrl-Alt-R as a hotkey to restart the script.
^!r::
Reload
QuahkeCommands.Message.send("Quahke reloaded")
return
