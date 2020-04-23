class Quahke {
  press(key){
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
}