global enabledLayer := ""

thm := new TapHoldManager(0, 175, 1, "$*")
for i, key in allKeys {
  thm.Add(key, Func("layerer").bind(key))
}
thm.Add("Space", Func("layerer").Bind("{Space}"))

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