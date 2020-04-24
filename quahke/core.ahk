;;
;; Reexports all the Quahke features
;;

#Include <RunOrActivate>
#Include <TapHoldManager>

#include quahke/init.ahk

class Q {
  #include quahke/builtins.ahk
  #include quahke/commands/core.ahk
  #include quahke/layers/core.ahk

  __init__(){
    ;; We don't initialize Layers, so the user can turn them off
    ;; Q.Layers.__init__()
  }

  __finalize__(){
    Q.Layers.__finalize__()
  }
}

#include %A_MyDocuments%\Quahke
#include init.ahk