#include layers/all-keys.ahk
#include layers/thm-init.ahk
#include layers-help.ahk

global USERNAME := "nikit"

class Layers {
  class space {
    hold(isDown){
      if (isDown) {
        Tooltip holding space
      } else {
        Tooltip
      }
    }
  }
  class a {
    hold(isDown){
      Send % "{Shift " (isDown? "down" : "up") "}"
    }
  }

  ;; Window management
  class b {
    h(){
      Send #{Left}
    }

    l() {
      Send #{Right}
    }

    m() {
      Send #{Up}
    }

    o() {
      Send #+{Left}
    }

    p() {
      Send #+{Right}
    }
  }

  class c {
    h() {
      Send -
    }

    j() {
      Send _
    }

    k() {
      Send {(}
    }

    l() {
      Send {)}
    }

    m() {
      Send {}}
    }

    n() {
      Send {{}
    }

    q() {
      Send % "'"
    }

    r() {
      Send "
    }

    u() {
      Send {=}
    }

    w() {
      Send "
    }

    y() {
      Send {+}
    }

    comma() {
      Send [
    }

    period() {
      Send ]
    }
  }

  class d {
    hold(isDown){
      Send % "{Alt " (isDown? "down" : "up") "}"
    }
  }

  class f {
    hold(isDown){
      Send % "{Ctrl " (isDown? "down" : "up") "}"
    }
  }

  class g {
    i() {
      RunOrActivateTitle("C:\Users\" . USERNAME . "\AppData\Local\Programs\nirvanahq\Nirvana.exe", "ahk_exe Nirvana.exe")
      Send I
    }

    n() {
      WoxSearch("duckduckgo ")
    }

    p() {
      WoxSearch("")
    }

    q() {
      WoxSearch("espanso ")
    }

    y() {
      WoxSearch("youtube ")
    }
  }

  class j {
    hold(isDown){
      Send % "{Ctrl " (isDown? "down" : "up") "}"
    }
  }

  class k {
    hold(isDown){
      Send % "{Alt " (isDown? "down" : "up") "}"
    }
  }

  class l {
    hold(isDown){
      Send % "{RWin " (isDown? "down" : "up") "}"
    }
  }

  ;; Lower accents
  class p {
    a() {
      Send á
    }

    e() {
      Send é
    }

    i() {
      Send í
    }

    n(){
      Send ñ
    }

    o() {
      Send ó
    }

    s(){
      Send ^+!s
    }

    u(){
      Send ú
    }
  }

  ;; upper accents
  class q {
    a(){
      Send Á
    }

    e() {
      Send É
    }

    i() {
      Send Í
    }

    n() {
      Send Ñ
    }

    o() {
      Send Ó
    }

    u() {
      Send Ú
    }
  }

  class s {
    hold(isDown){
      Send % "{LWin " (isDown? "down" : "up") "}"
    }
  }

  class v {
    h() {
      Send {Media_Prev}
    }

    j() {
      Send {Volume_Mute}
    }

    k() {
      Send {Media_Play_Pause}
    }

    l() {
      Send {Media_Next}
    }

    m() {
      Send {Volume_Up}
    }

    n() {
      Send {Volume_Down}
    }

    s() {
      RunOrActivateTitle("C:\Users\" . USERNAME . "\AppData\Roaming\Spotify\Spotify.exe", "Spotify")
    }
  }

  class w {
    f() {
      RunOrActivateTitle("C:\Program Files\Mozilla Firefox\firefox.exe", "ahk_exe firefox.exe")
    }

    g() {
      RunOrActivateTitle("C:\Program Files (x86)\fournova\Tower\Tower.exe", "ahk_exe Tower.exe")
    }

    e() {
      Run "explorer.exe"
    }

    l() {
      RunOrActivateTitle("C:\Users\" . USERNAME . "\AppData\Local\slack\slack.exe", "Slack")
    }

    n() {
      RunOrActivateTitle("C:\Users\nikit\AppData\Local\Programs\Notion\Notion.exe", "ahk_exe Notion.exe")
    }

    t() {
      RunOrActivateTitle("C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_0.5.2762.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe", "ahk_exe WindowsTerminal.exe")
    }

    v() {
      RunOrActivateTitle("C:\Program Files\Microsoft VS Code\Code.exe", "Visual Studio Code")
    }
  }

  class x {
    e() {
      Send ^{Right}
    }

    h() {
      PassthroughKey("{Left}")
    }

    j() {
      PassthroughKey("{Down}")
    }

    k() {
      PassthroughKey("{Up}")
    }

    l() {
      PassthroughKey("{Right}")
    }

    m() {
      Send {Delete}
    }

    n() {
      Send {BackSpace}
    }

    p() {
      Send {Tab}
    }

    w() {
      Send ^{Left}
    }

    semicolon() {
      Send {Enter}
    }

    comma() {
      Send ^{BackSpace}
    }

    period() {
      Send ^{Delete}
    }

    four() {
      Send {End}
    }

    zero() {
      Send {Home}
    }

  }

  class z {
    t() {
      RunOrActivateTitle("C:\Program Files\WindowsApps\38833FF26BA1D.UnigramPreview_3.13.2649.0_x64__g9c9v27vpyspw\Unigram.exe", "Unigram")
    }
  }

  class semicolon {
    hold(isDown){
      Send % "{Shift " (isDown? "down" : "up") "}"
    }
  }
}

layerer(key, isHold, taps, state){
  keyString := equivalence[key]
  if (!keyString) {
    keyString := key
  }
  holdFunc := ""
  if (isHold) {
    holdFunc := Layers[keyString]["hold"]
  }
  if (isHold and state){
    if (holdFunc) {
      holdFunc.Call("", state)
    } else {
      enabledLayer := keyString
    }
  } else if (isHold and !state) {
    if (holdFunc) {
      holdFunc.Call("", state)
    } else {
      enabledLayer := ""
    }
  } else if (enabledLayer != "") {
    combinationFunction := Layers[enabledLayer][keyString]
    if (combinationFunction) {
      combinationFunction.call("")
    } else {
      PassthroughKey(key)
    }
  } else {
    PassthroughKey(key)
  }
}