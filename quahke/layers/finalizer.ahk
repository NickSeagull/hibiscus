;;
;; Quahke Layers finalizer
;;
;; Required to be able to toggle the layers feature,
;; and not blocking the rest of the framework
;;

; Enable layers using Ctrl-Alt-E
^!e::
Gosub, initialize_layers
return

initialize_layers:
  #Include layers.ahk
  QuahkeCommands.Message.send("Quahke - Layers On")