global enabledLayer := ""

thm := new TapHoldManager(0, 175, 1, "$*")
for i, key in allKeys {
  thm.Add(key, Func("layerer").bind(key))
}
thm.Add("Space", Func("layerer").Bind("{Space}"))
