#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance, force
oldbutton = NULL
Menu, Tray, noStandard
Menu, Tray, Add
Menu, Tray, Add, Weke, RunWekeSite
Menu, Tray, Add, Wylacz, ExitApptray
Menu, Tray, Add

; Add your existing functions here

if not A_IsAdmin
    Run *RunAs "%A_ScriptFullPath%"

IfWinExist, clumsy 0.3
{

}
else
{
    MsgBox, Nie Wlaczyles Clumsy!
    ExitApp
    return
}

Gui, Color, c282828, Verdana
Gui, Font, s8, Calisto MT

Gui, Add, Picture, x25 Y25 gBestSettingsButton Group,%a_workingdir%\button.png
Gui, Add, Text, x50 y37 cWhite center +BackgroundTrans vBestSettingsButtontext, Giga dobre`nustawienia
Gui, Add, Text, x150 y26 cWhite center +BackgroundTrans vTextjd, Przycisk Do Lagowania:
Gui, Add, DropDownList, x150 y40 vButtonChosse gChangeButton, MButton|LButton|RButton|XButton1|XButton2||ScrollLock|Delete|Insert|Home|End|PgUp|PgDn|Up|Down|Left|Right|LCtrl|Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|NumpadDot|NumLock|NumpadDiv|NumpadMult|NumpadAdd|NumpadSub|NumpadEnter|RAlt|LAlt|LShift|RShift|q|w|e|r|t|y|u|i|o|p|a|s|d|f|g|h|j|k|l|z|x|c|v|b|n|m|0|1|2|3|4|5|6|7|8|9|none

Gui, Show, W320 H100, WekeClumsyHelper XD
return

ChangeButton:
{
    GuiControlGet, checkifnull,,ButtonChosse
    if checkifnull = none
    {
        if oldbutton = NULL
        {
            return
        }
        else
        {
            HotKey, %oldbutton%, Off
            return
        }
        return
    }
    if oldbutton = NULL
    {
        GuiControlGet, var,,ButtonChosse
        HotKey, ~%var%, StartLag
        oldbutton = %var%
    }
    else
    {
        HotKey, %oldbutton%, Off
        GuiControlGet, var,,ButtonChosse
        HotKey, ~%var%, StartLag
        oldbutton = %var%
    }
    return
}

return

BestSettingsButton:
{
    ;ControlClick, Button2, clumsy 0.3
    ControlGet, var,Checked,,Button4,clumsy 0.3
    loop
    {
        ControlGet, var,Checked,,Button4,clumsy 0.3
        if var = 0
        {
            ControlFocus, Button4, clumsy 0.3
            sleep 10
            ControlClick, Button4, clumsy 0.3
            ControlClick, Button4, clumsy 0.3
        }
        else
        {
            Break
        }
    }
    sleep 50
    ControlSetText, Edit2, 3000, clumsy 0.3
    sleep 50
    ControlGet, var, Choice,,Edit1,clumsy 0.3
    if var != outbound
    {
        ControlSetText, Edit1, outbound, clumsy 0.3
    }
    MsgBox, Skonczone szefunciu, milego zabijania :)
    return
}

return

ExitApptray:
{
    Exitapp
    return
}

RunWekeSite:
{
    Run, https://www.youtube.com/channel/UC26ZhUvKYHlu0Y8u3rFaOZw
    return
}

StartLag:
{
    ControlClick, Button2, clumsy 0.3
}
