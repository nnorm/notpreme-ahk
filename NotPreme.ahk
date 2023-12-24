;Lower volume when scrolling on the task bar
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up 2}
WheelDown::Send {Volume_Down 2}
#If

;Minimize/rolldown active window when the user scrolls down on the title bar of the current active window
#If (MouseIsOver("ahk_class Shell_TrayWnd") != true) && DetectTitleBar()
WheelDown::
WinMinimize, A
#If

DetectTitleBar( )
{
	ws_MinHeight = 32
	CoordMode, Mouse, Screen
	MouseGetPos, mouse_x, mouse_y
	WinGetPos win_x, win_y, win_width, win_height, A

	if(isWindowFullScreen() != true)
	{
		if (mouse_y > win_y and mouse_y < win_y + ws_MinHeight){
			return true 
		}
		else{
			return false
		}
	}
}

isWindowFullScreen()
{
    WinGet, style, Style, A
    ; 0x800000 is WS_BORDER.
    ; 0x20000000 is WS_MINIMIZE.
    ; no border and not minimized
    retVal := (style & 0x20800000) ? 0 : 1
    Return, retVal
}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}