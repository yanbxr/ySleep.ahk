ySleep(sTime, ByRef start = "")
{
    Critical
    DllCall("QueryPerformanceCounter", "Int64*", counterBefore)
    if (start != "")
        counterBefore := start
    if (!frequency)
        DllCall("QueryPerformanceFrequency", "Int64*", frequency)
    if (sTime > 20) {
        DllCall("QueryPerformanceCounter", "Int64*", counterAfter)
        Critical Off
        Sleep, % sTime - (1000 * (counterAfter - counterBefore) / frequency) - 20
    }
    Critical
    end := (counterBefore + (frequency * (sTime / 1000))) - 1
    loop
    {
        DllCall("QueryPerformanceCounter", "Int64*", counterAfter)
    }
    until (end <= counterAfter)
    Critical Off
}
