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
;            Butler setup
;=========================================
class b {
  #include extensions/builtins/init.ahk
  #include extensions/clipboard/init.ahk
  #include extensions/wox/init.ahk
  #include extensions/layers/init.ahk
  #include extensions/window/init.ahk

  enable(){
    Process, Priority, AutoHotkey.exe, H
  }
}

;=========================================
;            Pass control to
;            the user config
;=========================================
b.enable()
#include %A_MyDocuments%\Butler
#include init.ahk