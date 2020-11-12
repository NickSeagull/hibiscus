class wox {
  search(category){
    if (category != "") {
      category .= " "
    }
    Send ^!+{Space}
    Sleep 100
    WinActivateBottom, ahk_exe Wox.exe
    Send ^a
    Send {BackSpace}
    Send % category
  }
}