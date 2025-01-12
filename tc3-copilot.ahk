; run as administrator to allow mouse locking
#Requires AutoHotkey v2.0
A_HotkeyInterval := 99999
A_MaxHotkeysPerInterval := 999999
#SuspendExempt true
;temporarily disables script
F1:: {
    Suspend
}
; disables script while chatting so keys are normal
$/:: {
    Send "{/}"
    if !A_isSuspended {
        Suspend
    } 
}
$Enter:: {
    Send "{Enter}"
    if A_isSuspended {
    Suspend
    }
}

F7:: {
    ExitApp
}

F2:: {
    Reload
}
#SuspendExempt false
#HotIf WinActive("ahk_exe RobloxPlayerBeta.exe")
;key rebinder
;Left side is the key that is to be changed.
;Movement
    p::w
    l::a
    `;::s
    '::d

    ;Teleport
    t::t
    RAlt::LAlt

    ;Unit Controls
    ]::g
    ,::c
    q::p
    f::f
    [::n
    RCtrl::LCtrl
    RShift::LShift

    ;roblox zoom
    ;i::i
    ;o::o

    ;Building Controls
    o::u
    k::k
    y::r

    ;Chat
    /::/

    ;Squads
    ;1::1
    ;2::2
    ;3::3

    ;autoclicker
    $F12:: {
        static toggle := false
        toggle := !toggle
        SetTimer(Click, toggle ? 1 : 0)
    }

    ;auto placer
    CoordMode "Pixel"
    $i:: {
        powerplant := "*50 C:\Users\EarthGman\src\ahk\tc3-copilot\imgs\powerplant1.png"
        findImage(powerplant)
    }
    $-:: {
        nuclearplant := "*50 C:\Users\EarthGman\src\ahk\tc3-copilot\imgs\nuclearplant1.png"
        findImage(nuclearplant)
    }
    $\:: {
        turret := "*50 C:\Users\EarthGman\src\ahk\tc3-copilot\imgs\turret1.png"
        findImage(turret)
    }
    $RWin:: {
        watermine := "*50 C:\Users\EarthGman\src\ahk\tc3-copilot\imgs\watermine1.png"
        findImage(watermine)
    }

findImage(filepath) {
    Send "{u}"
    Sleep 125
    if ImageSearch(&imgX, &imgY, A_ScreenWidth - 900, A_ScreenHeight - 900, A_ScreenWidth, A_ScreenHeight, filepath) {
        placeBuilding(imgX, imgY)
    }
    Return
}

placeBuilding(imgX, imgY) {
    BlockInput True
    MouseGetPos &xpos, &ypos
    MouseMove imgX, imgY
    MouseMove 0, -10, 0, "R"
    Sleep 100
    MouseClick "left"
    MouseMove xpos, ypos
    BlockInput False
}
