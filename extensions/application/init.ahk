class application {
  _path := ""

  ;; Static Methods

  ;; Runs or activates an app
  open(Target, WinTitle ){
    Sleep, 250  ;; required as winactivate doesn't work if we are pressing keys
    if (WinExist(WinTitle)) {
	    WinActivate, %WinTitle%
    } else {
		  Run, %Target%
    }
  }

  ;; Public methods

}