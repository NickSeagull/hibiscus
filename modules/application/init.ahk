class application {
  _path := ""

  ;; Static Methods

  ;; Runs or activates an app
  ;; source - https://autohotkey.com/board/topic/7129-run-a-program-or-switch-to-an-already-running-instance/#entry241691
  open(Target, WinTitle = "", Parameters = "" ){
    #WinActivateForce

    ; Required so it runs after the layer has been issued
    Sleep, 250

    ; Get the filename without a path
    SplitPath, Target, TargetNameOnly

    SetTitleMatchMode, 2

    Process, Exist, %TargetNameOnly%

    if (ErrorLevel > 0) {
      PID := ErrorLevel
    } else {
      Run, %Target% "%Parameters%", , , PID
    }

    If (WinTitle <> "") {
      WinWait, %WinTitle%, , 3
      WinActivateBottom, %WinTitle%
    } Else {
      WinWait, ahk_pid %PID%, , 3
      WinActivateBottom, ahk_pid %PID%
    }
  }

  ;; Public methods

}