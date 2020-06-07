class window {
  _id := ""

  visibleWindows(){
    WinGet, winID, List
    newWindows := []
    Loop, %winID% {
      newWindow := new b.window()
      newWindow._windowID := winID%A_Index%
      newWindows[%A_Index%] := newWindow
    }
    return newWindows
  }

  allWindows(){
    DetectHiddenWindows, On
    windows := this.visibleWindows()
    DetectHiddenWindows, Off
    return windows
  }
}