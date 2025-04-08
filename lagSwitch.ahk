#SingleInstance force
#Requires AutoHotkey v1.1+

; === Configuration ===
; !! IMPORTANT: Update these paths if you saved the .bat files elsewhere !!
EnableBatchFile  := A_ScriptDir . "\enable_roblox_firewall.bat"  ; Assumes .bat is in same folder as .ahk
DisableBatchFile := A_ScriptDir . "\disable_roblox_firewall.bat" ; Assumes .bat is in same folder as .ahk

; Initialize state: Assume the *next* action should be to ENABLE the block
; (Meaning we assume the rule is currently disabled/allowed)
lastActionWasEnable := false 
; Set to true if you want the first click to run the DISABLE batch instead.
; =====================

; Check if the script is running as Administrator - ESSENTIAL
if not A_IsAdmin {
    MsgBox, 48, Error, This script requires Administrator privileges to run the batch files correctly.`nPlease run as Administrator.
    ExitApp
}

Insert::
    global lastActionWasEnable ; Make sure we modify the global variable

    if (lastActionWasEnable) {
        ; Last action was ENABLE, so run DISABLE now
        Run, %DisableBatchFile%, , Hide ; Run the .bat file hidden
        
        lastActionWasEnable := false ; Update state: last action is now disable
    } else {
        ; Last action was DISABLE (or first run), so run ENABLE now
        Run, %EnableBatchFile%, , Hide ; Run the .bat file hidden
        
        lastActionWasEnable := true ; Update state: last action is now enable
    }
    
    ; Remove the tooltip after 2 seconds
    SetTimer, RemoveToolTip, -2000 
return

RemoveToolTip:
    ToolTip
return

; Optional: Add an exit hotkey (e.g., Ctrl+Alt+X)
; ^!x::ExitApp 