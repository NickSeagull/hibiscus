PromoteShortcut(shortcut, key, isHold, taps, state){
  TrayTip, Key Promoter ⚠, Use ' %shortcut% ', 0, 16
  Sleep 1500
  TrayTip
  PassthroughKey(key)
}


WoxSearch(category){
  Send ^!+{Space}
  Sleep 100
  WinActivateBottom, ahk_exe Wox.exe
  Send ^a
  Send {BackSpace}
  Send % category
}

PassthroughKey(key){
  modifier := ""
  if (GetKeyState("Shift", "P")){
    modifier := modifier . "+"
  }
  if (GetKeyState("Ctrl", "P")){
    modifier := modifier . "^"
  }
  if (GetKeyState("Alt", "P")){
    modifier := modifier . "!"
  }
  if (GetKeyState("RWin", "P")){
    modifier := modifier . "`#"
  }
  Send % modifier . key
  modifier := ""
}

NoOpKey(key, isHold, taps, state){
  if (!isHold) {
    PassthroughKey(key)
  }
}