class window {
  _id := ""

  ;; Static Methods

  ;; Returns a list of all the visible windows
  visibleWindows(){
    WinGet, winID, List
    newWindows := []
    Loop, %winID% {
      newWindow := new hs.window()
      newWindow._id := winID%A_Index%
      newWindows[%A_Index%] := newWindow
    }
    return newWindows
  }

  ;; Returns a list of all the windows, including the ones that are hidden
  allWindows(){
    DetectHiddenWindows, On
    windows := this.visibleWindows()
    DetectHiddenWindows, Off
    return windows
  }

  ;; Public methods

  close(){
    if(WinExist("ahk_id " . this._id)) {
      WinClose, % "ahk_id " . this._id
      return WinExist("ahk_id " . this._id)
    }
    return 0
  }
}