;;
;; Reexports all the Butler features
;;

#Include <RunOrActivate>
#Include <TapHoldManager>

#include butler/init.ahk

class b {
  #include butler/builtins.ahk
  #include butler/commands/core.ahk
  #include butler/layers/core.ahk

  __init__(){
    ;; We don't initialize Layers, so the user can turn them off
    ;; b.Layers.__init__()
  }

  __finalize__(){
    b.Layers.__finalize__()
  }
}

#include %A_MyDocuments%\Butler
#include init.ahk