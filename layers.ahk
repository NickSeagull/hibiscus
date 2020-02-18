﻿#include layers/thm-init.ahk

global USERNAME := "nikit"

;; Remap Sticky-A to Shift
AKey(isHold, taps, state){
  if (isHold){
    Send % "{Shift " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "p"){
      Send á
    } else if (enabledLayer == "q"){
      Send Á
    } else if (enabledLayer == "g"){
      Send Á
    } else {
      PassthroughKey("a")
    }
  }
}

;; Window management keys
BKey(isHold, taps, state){
  BindKey("b", isHold, state)
  if (!isHold) {
    PassthroughKey("b")
  }
}

;; Symbol keys
CKey(isHold, taps, state){
  BindKey("c", isHold, state)
  if (!isHold) {
    if (enabledLayer == "w"){
      RunOrActivateTitle("C:\Program Files (x86)\Microsoft\Edge Beta\Application\msedge.exe", "ahk_exe msedge.exe")
    } else {
      PassthroughKey("c")
    }
  }
}

;; Remap Sticky-D to Alt
DKey(isHold, taps, state){
  BindKey("d", isHold, state)
  if (isHold){
    Send % "{Alt " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "w"){
    } else {
      PassthroughKey("d")
    }
  }
}

;; Automation layer
EKey(isHold, taps, state){
  if (isHold) {
    BindKey("e", isHold, state)
  } else {
    if (enabledLayer == "w"){
      Run "explorer.exe"
    } else iF (enabledLayer == "p"){
      Send é
    } else if (enabledLayer == "q"){
      Send É
    } else if (enabledLayer == "x"){
      Send ^{Right}
    } else {
      PassthroughKey("e")
    }
  }
}

;; Remap Sticky-F to Ctrl
FKey(isHold, taps, state){
  if (isHold){
    Send % "{Ctrl " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "k"){
    } else {
      PassthroughKey("f")
    }
  }
}

GKey(isHold, taps, state){
  BindKey("g", isHold, state)
  if (!isHold) {
    if (enabledLayer == "w"){
    } else {
      PassthroughKey("g")
    }
  }
}

HKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
      PassthroughKey("{Left}")
    } else if (enabledLayer == "c"){
      Send -
    } else if (enabledLayer == "b"){
      Send #{Left}
    } else if (enabledLayer == "v"){
      Send {Media_Prev}
    } else {
      PassthroughKey("h")
    }
  }
}

IKey(isHold, taps, state){
  BindKey("i", isHold, state)
  if (!isHold){
    if (enabledLayer == "p") {
      Send í
    } else if (enabledLayer == "q") {
      Send Í
    } else if (enabledLayer == "g"){
      RunOrActivateTitle("C:\Users\" . USERNAME . "\AppData\Local\Programs\nirvanahq\Nirvana.exe", "ahk_exe Nirvana.exe")
      Send I
    } else {
      PassthroughKey("i")
    }
  }
}

;; Remap Sticky-J to Ctrl
JKey(isHold, taps, state){
  if (isHold){
    Send % "{Ctrl " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "x"){
      PassthroughKey("{Down}")
    } else if (enabledLayer == "c"){
      Send _
    } else if (enabledLayer == "v"){
      Send {Volume_Mute}
    } else {
      PassthroughKey("j")
    }
  }
}

;; Remap Sticky-K to Alt
KKey(isHold, taps, state){
  BindKey("k", isHold, state)
  if (isHold){
    Send % "{Alt " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "x"){
      PassthroughKey("{Up}")
    } else if (enabledLayer == "c"){
      Send {(}
    } else if (enabledLayer == "v"){
      Send {Media_Play_Pause}
    } else {
      PassthroughKey("k")
    }
  }
}

;; Remap Sticky-L to Win
LKey(isHold, taps, state){
  if (isHold){
    Send % "{RWin " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "x"){
      PassthroughKey("{Right}")
    } else if (enabledLayer == "c"){
      Send {)}
    } else if (enabledLayer == "w"){
      RunOrActivateTitle("C:\Users\" . USERNAME . "\AppData\Local\slack\slack.exe", "Slack")
    } else if (enabledLayer == "v"){
      Send {Media_Next}
    } else if (enabledLayer == "b"){
      Send #{Right}
    } else {
      PassthroughKey("l")
    }
  }
}

MKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "v") {
      Send {Volume_Up}
    } else if (enabledLayer == "b") {
      Send #{Up}
    } else if (enabledLayer == "c"){
      Send {}}
    } else if (enabledLayer == "x") {
      Send {Delete}
    } else {
      PassthroughKey("m")
    }
  }
}

NKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "v") {
      Send {Volume_Down}
    } else if (enabledLayer == "d"){
      Run % "explorer.exe " . Clipboard
    } else if (enabledLayer == "c"){
      Send {{}
    } else if (enabledLayer == "p"){
      Send ñ
    } else if (enabledLayer == "q"){
      Send Ñ
    } else if (enabledLayer == "g"){
      WoxSearch("duckduckgo ")
    } else if (enabledLayer == "w") {
      RunOrActivateTitle("C:\Users\" . USERNAME . "\AppData\Local\Programs\nirvanahq\Nirvana.exe", "ahk_exe Nirvana.exe")
    } else if (enabledLayer == "x") {
      Send {BackSpace}
    } else {
      PassthroughKey("n")
    }
  }
}

OKey(isHold, taps, state){
  BindKey("o", isHold, state)
  if (!isHold){
    if (enabledLayer == "p") {
      Send ó
    } else if (enabledLayer == "q") {
      Send Ó
    } else if (enabledLayer == "b") {
      Send #+{Left}
    } else if (enabledLayer == "w"){
      RunOrActivateTitle("C:\Program Files\Sublime Text 3\sublime_text.exe", "ahk_exe sublime_text.exe")
    } else {
      PassthroughKey("o")
    }
  }
}

;; accent layer
PKey(isHold, taps, state){
  BindKey("p", isHold, state)
  if (!isHold){
    if (enabledLayer == "g"){
      WoxSearch("")
    } else if (enabledLayer == "e"){
      RunOrActivateTitle("C:\Program Files\Microsoft VS Code\Code.exe C:\Users\" . USERNAME . "\dev\my-windows", "Visual Studio Code*my-windows")
    } else if (enabledLayer == "x") {
      Send {Tab}
    } else if (enabledLayer == "b") {
      Send #+{Right}
    } else {
      PassthroughKey("p")
    }
  }
}

;; caps accent layer
QKey(isHold, taps, state){
  BindKey("q", isHold, state)
  if (!isHold){
    if (enabledLayer == "c"){
      Send % "'"
    } else {
      PassthroughKey("q")
    }
  }
}

RKey(isHold, taps, state){
  if (!isHold){
    if (enabledLayer == "c"){
      Send "
    } else if (enabledLayer == "x"){
      Send {End}
    } else {
      PassthroughKey("r")
    }
  }
}

;; Remap Sticky-S to Win
SKey(isHold, taps, state){
  if (isHold){
    Send % "{LWin " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "w"){
    } else if (enabledLayer == "v"){
      RunOrActivateTitle("C:\Users\" . USERNAME . "\AppData\Roaming\Spotify\Spotify.exe", "Spotify")
    } else {
      PassthroughKey("s")
    }
  }
}

TKey(isHold, taps, state){
  if (!isHold){
    if (enabledLayer == "w"){
      RunOrActivateTitle("C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_0.5.2762.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe", "ahk_exe WindowsTerminal.exe")
    } else if (enabledLayer == "z"){
      RunOrActivateTitle("C:\Program Files\WindowsApps\38833FF26BA1D.UnigramPreview_3.13.2649.0_x64__g9c9v27vpyspw\Unigram.exe", "Unigram")
    } else {
      PassthroughKey("t")
    }
  }
}

UKey(isHold, taps, state){
  BindKey("u", isHold, state)
  if (!isHold){
    if (enabledLayer == "p") {
      Send ú
    } else if (enabledLayer == "q") {
      Send Ú
    } else if (enabledLayer == "c") {
      Send {=}
    } else {
      PassthroughKey("u")
    }
  }
}
;; Media keys
VKey(isHold, taps, state){
  BindKey("v", isHold, state)
  if (!isHold) {
    if (enabledLayer == "w"){
      RunOrActivateTitle("C:\Program Files\Microsoft VS Code\Code.exe", "Visual Studio Code")
    }
    PassthroughKey("v")
  }
}

;; App keys
WKey(isHold, taps, state){
  BindKey("w", isHold, state)
  if (!isHold) {
    if (enabledLayer == "c"){
      Send "
    } else if (enabledLayer == "x"){
      Send ^{Left}
    } else {
      PassthroughKey("w")
    }
  }
}

;; Vim keys
XKey(isHold, taps, state){
  BindKey("x", isHold, state)
  if (!isHold) {
    PassthroughKey("x")
  }
}

YKey(isHold, taps, state){
  BindKey("y", isHold, state)
  if (!isHold) {
    if (enabledLayer == "c"){
      Send {+}
    } else if (enabledLayer == "g"){
      WoxSearch("youtube ")
    } else {
      PassthroughKey("y")
    }
  }
}

ZKey(isHold, taps, state){
  BindKey("z", isHold, state)
  if (!isHold) {
    if (enabledLayer == "x"){
    } else {
      PassthroughKey("z")
    }
  }
}

;; Remap Sticky-; to Shift
SemicolonKey(isHold, taps, state){
  if (isHold){
    Send % "{Shift " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "x"){
      Send {Enter}
    } else {
      PassthroughKey(";")
    }
  }
}

CommaKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
      Send ^{BackSpace}
    } else if (enabledLayer == "c"){
      Send [
    } else {
      PassthroughKey(",")
    }
  }
}

PeriodKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
      Send ^{Delete}
    } else if (enabledLayer == "c"){
      Send ]
    } else {
      PassthroughKey(".")
    }
  }
}

OneKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
    } else {
      PassthroughKey("1")
    }
  }
}

TwoKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
    } else {
      PassthroughKey("2")
    }
  }
}

ThreeKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
    } else {
      PassthroughKey("3")
    }
  }
}

FourKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
      Send {End}
    } else {
      PassthroughKey("4")
    }
  }
}

FiveKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
    } else {
      PassthroughKey("5")
    }
  }
}

SixKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
    } else {
      PassthroughKey("6")
    }
  }
}

SevenKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
    } else {
      PassthroughKey("7")
    }
  }
}

EightKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
    } else {
      PassthroughKey("8")
    }
  }
}

NineKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
    } else {
      PassthroughKey("9")
    }
  }
}

ZeroKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
      Send {Home}
    } else {
      PassthroughKey("0")
    }
  }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;  H E L P E R S  ;;;;;;;;;;;;;;;;;;;;;;;;;;

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

BindKey(layerName, isHold, state){
  if (isHold and state){
    enabledLayer := layerName
  }
  if (isHold and !state) {
    enabledLayer := ""
  }
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
