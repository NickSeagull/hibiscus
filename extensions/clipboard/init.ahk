class clipboard {
  clear(){
    clipboard := ""
  }

  copyImage(filepath){
    pToken := Gdip_Startup()
    pBitmap := Gdip_CreateBitmapFromFile(filepath)
    Gdip_SetBitmapToClipboard(pBitmap)
    Gdip_DisposeImage(pBitmap)
    Gdip_Shutdown(pToken)
  }
}