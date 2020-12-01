;;
;; Hibiscus Layers
;;
;; TODO: Add some description here
;;

class Layers {
  static enabledLayer := ""
  static equivalence := {}
  static allKeys := ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ".", ",", ";", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "\", "'", "/"]

  __init__() {
    hs.Layers.__buildEquivalence()
    thm := new TapHoldManager(0, 150, 1, "$*")
    for i, key in hs.Layers.allKeys {
      thm.Add(key, hs.Layers.__binder.bind("", key))
    }
    thm.Add("Space", hs.Layers.__binder.Bind("", "{Space}"))
    thm.Add("Esc", hs.Layers.__binder.Bind("", "{Esc}"))
    thm.Add("RShift", hs.Layers.__binder.Bind("", "{>+}"))
    thm.Add("LShift", hs.Layers.__binder.Bind("", "{<+}"))
  }

  __finalize__() {
  }

  __buildEquivalence(){
    hs.Layers.equivalence["."] := "period"
    hs.Layers.equivalence[","] := "comma"
    hs.Layers.equivalence[";"] := "semicolon"
    hs.Layers.equivalence["1"] := "one"
    hs.Layers.equivalence["2"] := "two"
    hs.Layers.equivalence["3"] := "three"
    hs.Layers.equivalence["4"] := "four"
    hs.Layers.equivalence["5"] := "five"
    hs.Layers.equivalence["6"] := "six"
    hs.Layers.equivalence["7"] := "seven"
    hs.Layers.equivalence["8"] := "eight"
    hs.Layers.equivalence["9"] := "nine"
    hs.Layers.equivalence["0"] := "zero"
    hs.Layers.equivalence["{Space}"] := "space"
    hs.Layers.equivalence["Space"] := "space"
    hs.Layers.equivalence["\"] := "backslash"
    hs.Layers.equivalence["'"] := "quote"
    hs.Layers.equivalence["/"] := "slash"
    hs.Layers.equivalence["{>+}"] := "rightshift"
    hs.Layers.equivalence["RShift"] := "rightshift"
    hs.Layers.equivalence["{<+}"] := "leftshift"
    hs.Layers.equivalence["LShift"] := "leftshift"
    hs.Layers.equivalence["{Esc}"] := "esc"
    hs.Layers.equivalence["Esc"] := "esc"
  }

  __keyRelease(key, holdFunc){
    ; Send {%key% up}
    hs.Layers.enabledLayer := ""
    if (holdFunc){
      holdFunc.Call("")
    }
    Tooltip
  }

  __binder(key, isHold, taps, state){
    ;; Try to get a string equivalence for the key
    keyString := hs.Layers.equivalence[key]
    if (!keyString) {
      keyString := key
    }

    ;; Get the `hold` method of the layer
    holdFunc := ""
    if (isHold) {
      holdFunc := Layers[keyString]["hold"]
    }

    keyRelease := ObjBindMethod(hs.Layers, "__keyRelease", key, holdFunc)
    ;; If the key is being held and got pressed
    if (isHold and state){
      SetTimer, % keyRelease , -250
      ;; If a `doc` object exists, show some help
      ;; regarding it
      if (Layers[keyString]["doc"]){
        layerTip :=  keyString . " layer`n`n"
        for dockey, docdesc in Layers[keyString]["doc"] {
          sep := "`t"
          if (StrLen(dockey) < 7){
            sep .= "`t"
          }
          layerTip .= dockey . sep . "👉`t" . docdesc . "`n"
        }
        CoordMode, Tooltip, Screen
        Tooltip, % layerTip, 0, 0
      }

      ;; If the hold function exists, we call it directly
      if (holdFunc) {
        ;; Pass press/release (state variable)
        holdFunc.Call("", state)

      ;; If not, we enable the layer
      } else {
        hs.Layers.enabledLayer := keyString
      }
    ;; If the key is being held and released
    } else if (isHold and !state) {
      SetTimer, % keyRelease , Off
      CoordMode, Tooltip, Window
      Tooltip

      ;; If the hold function exists we call it directly
      if (holdFunc) {
        ;; Pass press/release (state variable)
        holdFunc.Call("", state)
      } else {

        ;; If not, we disable the layer
        hs.Layers.enabledLayer := ""
      }

    ;; If a layer has been enabled
    } else if (hs.Layers.enabledLayer != "") {

      ;; We get the appropriate function for the current key press in
      ;; the current enabled layer
      combinationFunction := Layers[hs.Layers.enabledLayer][keyString]
      if (combinationFunction) {
        combinationFunction.call("")
      } else {
        ;; If it doesn't exist, we just pass through the key
        hs.press(key)
      }

    ;; If no layer, no hold, no anything, we just passthrough the key
    } else {
      hs.press(key)
    }
  }
}