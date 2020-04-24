;=========================================
;            AutoHotKey flags
;=========================================
#Warn
#SingleInstance, Force
#KeyHistory, 0
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
#Include <RunOrActivate>
#Include <TapHoldManager>

;=========================================
;            Butler setup
;=========================================
class b {
  #include extensions/builtins/init.ahk
  #include extensions/wox/init.ahk
  #include extensions/layers/init.ahk

  enable(){
  }
}

;=========================================
;            Pass control to
;            the user config
;=========================================
b.enable()
#include %A_MyDocuments%\Butler
#include init.ahk