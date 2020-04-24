;;
;; Butler Layers
;;
;; TODO: Add some description here
;;

class Layers {
  static enabledLayer := ""
  static equivalence := {}
  static allKeys := ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ".", ",", ";", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

  __init__() {
    Q.Layers.__buildEquivalence()
    thm := new TapHoldManager(0, 175, 1, "$*")
    for i, key in Q.Layers.allKeys {
      thm.Add(key, Q.Layers.__binder.bind("", key))
    }
    thm.Add("Space", Q.Layers.__binder.Bind("", "{Space}"))
  }

  __finalize__() {
  }

  __buildEquivalence(){
    Q.Layers.equivalence["."] := "period"
    Q.Layers.equivalence[","] := "comma"
    Q.Layers.equivalence[";"] := "semicolon"
    Q.Layers.equivalence["1"] := "one"
    Q.Layers.equivalence["2"] := "two"
    Q.Layers.equivalence["3"] := "three"
    Q.Layers.equivalence["4"] := "four"
    Q.Layers.equivalence["5"] := "five"
    Q.Layers.equivalence["6"] := "six"
    Q.Layers.equivalence["7"] := "seven"
    Q.Layers.equivalence["8"] := "eight"
    Q.Layers.equivalence["9"] := "nine"
    Q.Layers.equivalence["0"] := "zero"
    Q.Layers.equivalence["{Space}"] := "space"
  }

  __binder(key, isHold, taps, state){
    keyString := Q.Layers.equivalence[key]
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
        Q.Layers.enabledLayer := keyString
      }
    } else if (isHold and !state) {
      if (holdFunc) {
        holdFunc.Call("", state)
      } else {
        Q.Layers.enabledLayer := ""
      }
    } else if (Q.Layers.enabledLayer != "") {
      combinationFunction := Layers[Q.Layers.enabledLayer][keyString]
      if (combinationFunction) {
        combinationFunction.call("")
      } else {
        Q.press(key)
      }
    } else {
      Q.press(key)
    }
  }
}