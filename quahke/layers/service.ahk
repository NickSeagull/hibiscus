class QuahkeLayers {
  static enabledLayer := ""
  static equivalence := {}
  static allKeys := ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ".", ",", ";", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

  start() {
    QuahkeLayers.__buildEquivalence()
    thm := new TapHoldManager(0, 175, 1, "$*")
    for i, key in QuahkeLayers.allKeys {
      thm.Add(key, QuahkeLayers.__binder.bind("", key))
    }
    thm.Add("Space", QuahkeLayers.__binder.Bind("", "{Space}"))
  }

  __buildEquivalence(){
    QuahkeLayers.equivalence["."] := "period"
    QuahkeLayers.equivalence[","] := "comma"
    QuahkeLayers.equivalence[";"] := "semicolon"
    QuahkeLayers.equivalence["1"] := "one"
    QuahkeLayers.equivalence["2"] := "two"
    QuahkeLayers.equivalence["3"] := "three"
    QuahkeLayers.equivalence["4"] := "four"
    QuahkeLayers.equivalence["5"] := "five"
    QuahkeLayers.equivalence["6"] := "six"
    QuahkeLayers.equivalence["7"] := "seven"
    QuahkeLayers.equivalence["8"] := "eight"
    QuahkeLayers.equivalence["9"] := "nine"
    QuahkeLayers.equivalence["0"] := "zero"
    QuahkeLayers.equivalence["{Space}"] := "space"
  }

  __binder(key, isHold, taps, state){
    keyString := QuahkeLayers.equivalence[key]
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
        QuahkeLayers.enabledLayer := keyString
      }
    } else if (isHold and !state) {
      if (holdFunc) {
        holdFunc.Call("", state)
      } else {
        QuahkeLayers.enabledLayer := ""
      }
    } else if (QuahkeLayers.enabledLayer != "") {
      combinationFunction := Layers[QuahkeLayers.enabledLayer][keyString]
      if (combinationFunction) {
        combinationFunction.call("")
      } else {
        Quahke.press(key)
      }
    } else {
      Quahke.press(key)
    }
  }
}