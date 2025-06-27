#Persistent
#NoTrayIcon  ; 完全隐藏托盘图标
#NoEnv
SendMode Input

String1 := "string1"
String2 := "string2"

; 设置热键 Ctrl + / 来显示选择菜单
^8::
    ; 创建 GUI
    Gui, Add, Text, , 根据编号输入字符串：`n1: 我的密码`n2: 公司密码
    Gui, Add, Edit, vOutputVar w200, 1  ; 默认值为1, 宽度200
    Gui, Add, Button, Default, 确定
    Gui, Show, , 选择选项
return

; 处理确定按钮
Button确定:
    Gui, Submit, NoHide  ; 提交并保留 GUI 窗口

    ; 处理用户输入，去掉前后空格
    OutputVar := Trim(OutputVar)

    ; 根据输入选择字符串
    if (OutputVar = "1") {
        StringToSend := Trim(String1)  ; 确保去掉前后空格
    } else if (OutputVar = "2") {
        StringToSend := Trim(String2)  ; 确保去掉前后空格
    }

    Gui, Destroy  ; 关闭 GUI 窗口
    Sleep, 100  ; 等待剪贴板更新
    ; 将要发送的字符串复制到剪贴板
    Clipboard := StringToSend  ; 确保去掉前后空格
    Sleep, 100  ; 等待剪贴板更新

    ; 模拟粘贴
    Send, ^v  ; Ctrl + V 来粘贴剪贴板的内容
return

; 处理 ESC 键的事件
GuiEscape:
GuiClose:
    Gui, Destroy
return

~!m::  ; 监视 Alt + M
   WinMinimizeAll
return

~!n::  ; 监视 Alt + N
    WinMinimizeAllUndo
return

^+q::
    try {
        if WinExist("Windows 任务管理器") {
            WinActivate
        } else {
            Run, taskmgr.exe
        }
    }
return

; capslock
F15Pressed := false  ; 标记 F15 是否被按下

; F15 按下时的处理
F15::
    F15Pressed := true  ; 设置为按下状态
    return

; F15 释放时的处理
F15 Up::
    F15Pressed := false  ; 重置为未按下状态
    return

; 处理 F15 与其他键的组合
#If (F15Pressed)
    ; H/J/K/L 用于方向键
    h::Send, {Left}   ; Ctrl + H
    j::Send, {Down} ; Ctrl + J
    k::Send, {Up}     ; Ctrl + K
    l::Send, {Right}  ; Ctrl + L

    ; M/A/E 与 F15 组合
    m::Send, {Backspace}  ; Ctrl + M
    a::Send, {Home}    ; Ctrl + A
    b::Send, ^u  ; Ctrl + U
    e::Send, {End}     ; Ctrl + E

    ; F15 + [ 等于 Esc
    [::Send, {Esc} ; 发送 Ctrl + [
 
    ; 字母键
    c::Send, ^c  ; Ctrl + C
    d::Send, ^d  ; Ctrl + D
    f::Send, ^f  ; Ctrl + F
    g::Send, ^g  ; Ctrl + G
    i::Send, ^i  ; Ctrl + I
    n::Send, ^b  ; Ctrl+l
    o::Send, ^o  ; Ctrl + O
    p::Send, ^h  ; Ctrl+H
    q::Send, ^q  ; Ctrl + Q
    r::Send, ^r  ; Ctrl + R
    s::Send, ^s  ; Ctrl + S
    t::Send, ^t
    ; Ctrl + T
    u::Send, ^u  ; Ctrl + U
    v::Send, ^v  ; Ctrl + V
    w::Send, ^w  ; Ctrl + W
    x::Send, ^x  ; Ctrl + X
    y::Send, ^y  ; Ctrl + Y
    z::Send, ^z  ; Ctrl + Z

    ; 数字键
    0::Send, ^0  ; Ctrl + 0
    1::Send, ^1  ; Ctrl + 1
    2::Send, ^2  ; Ctrl + 2
    3::Send, ^3  ; Ctrl + 3
    4::Send, ^4  ; Ctrl + 4
    5::Send, ^5  ; Ctrl + 5
    6::Send, ^6  ; Ctrl + 6
    7::Send, ^7  ; Ctrl + 7
    8::Send, ^8  ; Ctrl + 8
    9::Send, ^9  ; Ctrl + 9

    ; 符号键
    `::Send, ^`  ; Ctrl + `
    -::Send, ^-  ; Ctrl + -
    =::Send, ^=  ; Ctrl + =
    ]::Send, ^]  ; Ctrl + ]
    \::Send, ^\  ; Ctrl + \
    ;::Send, ^;  ; Ctrl + ;
    '::Send, ^'  ; Ctrl + '
    ,::Send, ^,  ; Ctrl + ,
    .::Send, ^.  ; Ctrl + .
    /::Send, ^/  ; Ctrl + /
#If

#IfWinActive ahk_exe WindowsTerminal.exe  ; 只在 Windows Terminal 窗口中有效

; 当 Ctrl + N 被按下时，发送 Ctrl + Tab
^n::
    Send, ^{Tab}
    return

; 当 Ctrl + P 被按下时，发送 Ctrl + Shift + Tab
^p::
    Send, ^+{Tab}
    return

^w::
    Send, ^+{w}
    return

#IfWinActive  ; 结束窗口激活上下文

; 设置 AltTabTer 作为上层窗口
#IfWinActive ahk_exe AltTabTer.exe

; 将 J 映射为左箭头
j::
    Send, {Down}
    return

; 将 K 映射为下箭头
k::
    Send, {Up}
    return

; 将 H 映射为上箭头
h::
    Send, {Left}
    return

; 将 L 映射为右箭头
l::
    Send, {Right}
    return

; 将空格映射为 Esc
Space::
    Send, {Esc}
    return

#IfWinActive  ; 结束上下文

; Ctrl + Shift + U 映射为最大化
^+u::WinMaximize, A  ; 最大化当前窗口

; 将 Ctrl + Shift + H/J/K/L 映射为窗口调整
^+h::
    WinRestore, A  ; 恢复窗口为正常状态
    WinMove, A,, 0, 0, A_ScreenWidth / 2, A_ScreenHeight  ; 移动到左半边
return

^+j::
    WinRestore, A  ; 恢复窗口为正常状态
    WinMove, A,, 0, A_ScreenHeight / 2, A_ScreenWidth, A_ScreenHeight / 2  ; 移动到下半边
return

^+k::
    WinRestore, A  ; 恢复窗口为正常状态
    WinMove, A,, 0, 0, A_ScreenWidth, A_ScreenHeight / 2  ; 移动到上半边
return

^+l::
    WinRestore, A  ; 恢复窗口为正常状态
    WinMove, A,, A_ScreenWidth / 2, 0, A_ScreenWidth / 2, A_ScreenHeight  ; 移动到右半边
return

; 初始化一个全局变量来跟踪当前显示器
currentMonitor := 1

^+p::  ; Ctrl + Shift + P
    ; 获取连接的监视器数量
    SysGet, MonitorCount, MonitorCount
    
    ; 获取当前活动窗口
    WinGet, activeWin, ID, A
    WinGetClass, winClass, ahk_id %activeWin%
    WinGet, winProcess, ProcessName, ahk_id %activeWin%
    WinGet, winMax, MinMax, ahk_id %activeWin%
    
    ; 检查窗口是否最大化
    isMaximized := (winMax = 1)

    ; 特殊处理网易POPO窗口（兼容Qt和NpMainWndClass两种窗口类）
    isPOPO := (winProcess = "POPO.exe") || (winClass = "Qt643QWindowIcon") || (winClass = "NpMainWndClass")

    ; 如果是最大化窗口，先取消最大化（Chrome和POPO特殊处理）
    if (isMaximized) ; Chrome和POPO不需要取消最大化
    {
        WinRestore, ahk_id %activeWin%
        Sleep, 100 ; 增加延迟确保窗口已恢复
    }
    
    ; 获取当前窗口位置和大小
    WinGetPos, X, Y, Width, Height, ahk_id %activeWin%
    
    ; 确定窗口当前所在的显示器
    windowOnMonitor := 1  ; 默认设为1
    Loop, %MonitorCount%
    {
        SysGet, Monitor, Monitor, %A_Index%
        if (X >= MonitorLeft && X < MonitorRight && Y >= MonitorTop && Y < MonitorBottom)
        {
            windowOnMonitor := A_Index
            break
        }
    }
    
    ; 计算下一个显示器的编号
    currentMonitor := (windowOnMonitor >= MonitorCount) ? 1 : windowOnMonitor + 1
    
    ; 获取下一个显示器的位置和尺寸
    SysGet, MonitorRect, Monitor, %currentMonitor%
    TargetX := MonitorRectLeft
    TargetY := MonitorRectTop
    MonitorWidth := MonitorRectRight - MonitorRectLeft
    MonitorHeight := MonitorRectBottom - MonitorRectTop
 
    if (isMaximized)
    {
        newWidth := MonitorWidth * 1.0
        newHeight := MonitorHeight * 1.0
        WinMove, ahk_id %activeWin%,, TargetX, TargetY, newWidth, newHeight
        if(!isPOPO)  {
            WinMaximize, ahk_id %activeWin%
        }
    }
    else
    {   
        if(isPOPO) {
          newWidth := MonitorWidth * 1.0  ; 80%宽度（避免渲染错误）
          newHeight := MonitorHeight * 1.0 ; 80%高度
          WinMove, ahk_id %activeWin%,, TargetX, TargetY, newWidth, newHeight
        }
        else {
          WinMove, ahk_id %activeWin%,, TargetX, TargetY, Width, Height
        }
    }
    
    ; 激活窗口（确保窗口保持激活状态）
    WinActivate, ahk_id %activeWin%
return

; 在网易 Popo 中将 Ctrl + j 和 Ctrl + k 映射为 Ctrl + 下箭头和 Ctrl + 上箭头
#If WinActive("网易POPO")  ; 仅在网易 Popo 窗口激活时生效
    Tab::
        ; 检查当前窗口是否为活动状态
        if WinActive("ahk_class Qt643QWindowIcon")
        {
            ; 获取当前焦点控件
            ControlGetFocus, focusedControl, ahk_class Qt643QWindowIcon

            ; 如果没有控件有焦点，则执行点击
            if (focusedControl = "")
            {

                ; 获取窗口的位置和大小
                WinGetPos, winX, winY, winWidth, winHeight, ahk_class Qt643QWindowIcon
            
                ; 计算目标点击点的坐标
                targetX := winX + (winWidth * 2/3)  ; 从左往右的1/2
                targetY := winY + (winHeight * 9/10)  ; 从上往下的19/20
            
                ; 执行点击
                Click, %targetX%, %targetY%
            }
        }
        return

    f15 & n::  ; F15 + n
            Send, ^{Down}  ; 发送 Ctrl + 下箭头
        return

    f15 & p::  ; F15 + p
            Send, ^{Up}  ; 发送 Ctrl + 上箭头
        return

    f15 & m::  ; Ctrl + k
        Send, {Backspace}  ; 发送 Ctrl + 上箭头
        return
    f15 & h::  ; Ctrl + k
        Send, {Left}  ; 发送 Ctrl + 上箭头
        return
    f15 & j::  ; Ctrl + k
        Send, {Down}  ; 发送 Ctrl + 上箭头
        return
    f15 & k::  ; Ctrl + k
        Send, {Up}  ; 发送 Ctrl + 上箭头
        return
    f15 & l::  ; Ctrl + k
        Send, {Right}  ; 发送 Ctrl + 上箭头
        return
    f15 & a::  ; Ctrl + k
        Send, {Home}  ; 发送 Ctrl + 上箭头
        return
    f15 & e::  ; Ctrl + k
        Send, {End}  ; 发送 Ctrl + 上箭头
        return
    f15 & [::  ; 使用 F15 + [ 键来触发点击
        ; 获取窗口的位置和大小
        WinGetPos, winX, winY, winWidth, winHeight, ahk_class Qt643QWindowIcon
        
        ; 计算目标点击点的坐标
        targetX := winX + (winWidth * 1/8)  ; 从左往右的1/8
        targetY := winY + (winHeight * 99/100)  ; 从上往下的1/5
        
        ; 执行点击
        Click, %targetX%, %targetY%
        return

    ^k::  ; Ctrl + k
        Send, ^f  ; 发送 Ctrl + f
#If  ; 结束条件块

#IfWinActive ahk_class Qt51514QWindowIcon
^k:: ; 当在微信窗口中按 Ctrl + K
    Send ^f ; 发送 Ctrl + F
return
#IfWinActive ; 结束上下文敏感热键

A_PreviouslyPressed := false  ; 重置标记
#IfWinActive ahk_class Chrome_WidgetWin_1  ; 确保只在 Chrome 中有效

; Ctrl + K -> Ctrl + T
^k::
    if !A_PreviouslyPressed
    {
        A_PreviouslyPressed := true
        Send, ^t
        SetTimer, ResetPressed, -500
    }
return

; 左箭头
F15 & h::
   Send, {Left}
return

; 右箭头
F15 & l::
   Send, {Right}
return

; 下箭头
F15 & j::
   Send, {Down}
return

; 上箭头
F15 & k::
   Send, {Up}
return

; 删除
F15 & m::
    Send, {Backspace}
return

F15 & a::
    Send, {Home}
return

F15 & e::
    Send, {End}
return

F15 & [::
    Send, {Esc}
return

Ctrl & n::return
Ctrl & p::return

; F15 + N -> Ctrl + Tab
F15 & n::
    if !A_PreviouslyPressed
    {
        Send, ^{Tab}
        A_PreviouslyPressed := true
        SetTimer, ResetPressed, -500
    }
return

; F15 + P -> Ctrl + Shift + Tab
F15 & p::
    if !A_PreviouslyPressed
    {
        Send, ^+{Tab}
        A_PreviouslyPressed := true
        SetTimer, ResetPressed, -500
    }
return

ResetPressed:
    A_PreviouslyPressed := false  ; 重置标记
return

#IfWinActive  ; 结束条件

^Delete:: ; Ctrl + Delete
    ; 弹出确认对话框
    MsgBox, 4,, 确定要清空回收站吗?
    IfMsgBox, Yes
    {
        ; 使用 PowerShell 清空垃圾桶
        Run, PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Confirm:$false", , Hide
    }
return

; left ctrl
; 定义全局变量
ctrlIsDown := false
ctrlDownTime := 0  ; 用于记录 Ctrl 键按下的时间

; 处理 Left Ctrl 按下事件
~LControl::    
    if (!ctrlIsDown) {
        ctrlIsDown := true
        ctrlDownTime := A_TickCount  ; 记录按下的时间
    }
return

; 处理 Left Ctrl 释放事件
~LControl Up::
    ; 只有在没有其他键按下的情况下，才执行下面的逻辑
    if (A_PriorKey == "LControl") {
        duration := A_TickCount - ctrlDownTime  ; 计算按下持续时间
        if (duration <= 1000) {  ; 如果持续时间小于或等于 1s
            ; 发送组合键 LWin + LControl + LAlt + Tab
            Send, {LWin Down}{LControl Down}{LAlt Down}{Tab}{LAlt Up}{LControl Up}{LWin Up}
        }
    }
    ctrlIsDown := false  ; 重置状态
return

; 定义全局变量
rctrlIsDown := false

; 处理Right Ctrl按下事件
~RControl::    
    if (!rctrlIsDown) {
        rctrlIsDown := true
    }
return

; 处理Right Ctrl释放事件
~RControl Up::
    ; 只有在没有其他键按下的情况下，才执行下面的逻辑
    if (A_PriorKey == "RControl") {
        Send, {CapsLock}
    }
    rctrlIsDown := false  ; 重置状态
return
