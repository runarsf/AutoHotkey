F1::
    GetKeyState, shiftstate, Shift, T
    if shiftstate = U
        SetCapsLockState AlwaysOn
    else
        SetCapsLockState AlwaysOff
    return