;;
;; Butler Layers
;;
;; TODO: Add some description here
;;

class Layers {
  static enabledLayer := ""
  static equivalence := {}
  static allKeys := ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ".", ",", ";", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "\", "'", "/"]

  __init__() {
    b.Layers.__buildEquivalence()
    thm := new TapHoldManager(0, 175, 1, "$*")
    for i, key in b.Layers.allKeys {
      thm.Add(key, b.Layers.__binder.bind("", key))
    }
    thm.Add("Space", b.Layers.__binder.Bind("", "{Space}"))
    thm.Add("RShift", b.Layers.__binder.Bind("", "{>+}"))
    thm.Add("LShift", b.Layers.__binder.Bind("", "{<+}"))
  }

  __finalize__() {
  }

  __buildEquivalence(){
    b.Layers.equivalence["."] := "period"
    b.Layers.equivalence[","] := "comma"
    b.Layers.equivalence[";"] := "semicolon"
    b.Layers.equivalence["1"] := "one"
    b.Layers.equivalence["2"] := "two"
    b.Layers.equivalence["3"] := "three"
    b.Layers.equivalence["4"] := "four"
    b.Layers.equivalence["5"] := "five"
    b.Layers.equivalence["6"] := "six"
    b.Layers.equivalence["7"] := "seven"
    b.Layers.equivalence["8"] := "eight"
    b.Layers.equivalence["9"] := "nine"
    b.Layers.equivalence["0"] := "zero"
    b.Layers.equivalence["{Space}"] := "space"
    b.Layers.equivalence["Space"] := "space"
    b.Layers.equivalence["\"] := "backslash"
    b.Layers.equivalence["'"] := "quote"
    b.Layers.equivalence["/"] := "slash"
    b.Layers.equivalence["{>+}"] := "rightshift"
    b.Layers.equivalence["RShift"] := "rightshift"
    b.Layers.equivalence["{<+}"] := "leftshift"
    b.Layers.equivalence["LShift"] := "leftshift"
  }

  __binder(key, isHold, taps, state){
    keyString := b.Layers.equivalence[key]
    if (!keyString) {
      keyString := key
    }
    holdFunc := ""
    if (isHold) {
      holdFunc := Layers[keyString]["hold"]
    }
    if (isHold and state){
      if (Layers[keyString]["doc"]){
        layerTip :=  keyString . " layer`n`n"
        for dockey, docdesc in Layers[keyString]["doc"] {
          sep := "`t"
          if (StrLen(dockey) < 7){
            sep .= "`t"
          }
          layerTip .= dockey . sep . "👉`t" . docdesc . "`n"
        }
        Tooltip, % layerTip, 0 0
      }
      if (holdFunc) {
        holdFunc.Call("", state)
      } else {
        b.Layers.enabledLayer := keyString
      }
    } else if (isHold and !state) {
      Tooltip
      if (holdFunc) {
        holdFunc.Call("", state)
      } else {
        b.Layers.enabledLayer := ""
      }
    } else if (b.Layers.enabledLayer != "") {
      combinationFunction := Layers[b.Layers.enabledLayer][keyString]
      if (combinationFunction) {
        combinationFunction.call("")
      } else {
        b.press(key)
      }
    } else {
      b.press(key)
    }
  }
}