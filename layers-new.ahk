class LayerManager {
  __New() {
  }

  create(firstKey, secondKey, action){

  }
}
layers := Dict()
Dict_Set(["w", "v"], Function("wv"), layers)
wv(){
  MsgBox wv
}

layers.get(["w", "v"])()