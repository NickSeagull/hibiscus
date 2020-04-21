allKeys := ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ".", ",", ";", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

global equivalence := {}
equivalence["."] := "period"
equivalence[","] := "comma"
equivalence[";"] := "semicolon"
equivalence["1"] := "one"
equivalence["2"] := "two"
equivalence["3"] := "three"
equivalence["4"] := "four"
equivalence["5"] := "five"
equivalence["6"] := "six"
equivalence["7"] := "seven"
equivalence["8"] := "eight"
equivalence["9"] := "nine"
equivalence["0"] := "zero"
equivalence["{Space}"] := "space"