;=========================================
;            AutoHotKey flags
;=========================================
#Warn All
#Warn UseUnsetLocal, Off
#Warn UseUnsetGlobal, Off
#SingleInstance, Force
#KeyHistory, 0
DetectHiddenWindows, Off
SetBatchLines, -1
ListLines, Off
SendMode Input
SetTitleMatchMode, 2
SetWorkingDir, %A_ScriptDir%
SplitPath, A_ScriptName, , , , thisscriptname
#MaxThreadsPerHotkey, 1
#Persistent

;=========================================
;            Libraries inclusion
;=========================================
#Include <TapHoldManager>
#Include Gdip_All.ahk

;=========================================
;            Hibiscus setup
;=========================================
class hs {
  #include modules/application/init.ahk
  #include modules/builtins/init.ahk
  #include modules/clipboard/init.ahk
  #include modules/wox/init.ahk
  #include modules/layers/init.ahk
  #include modules/window/init.ahk

  enable(){
    Process, Priority, AutoHotkey.exe, H
  }
}

;=========================================
;            Pass control to
;            the user config
;=========================================
hs.enable()
#include %A_MyDocuments%\Hibiscus
#include init.ahk