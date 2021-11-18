#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up 2}
WheelDown::Send {Volume_Down 2}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}