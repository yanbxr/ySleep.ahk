# ySleep

A high-precision sleep function for AutoHotkey v1.

## How it works

ySleep uses a hybrid approach for maximum precision with minimal CPU overhead:

- **Sleep phase** — for waits longer than 20ms, it delegates most of the time to AHK's `Sleep` command (low CPU usage)
- **Busy-wait phase** — the final ~20ms spins on `QueryPerformanceCounter` for sub-millisecond accuracy

## Usage

```autohotkey
#Include ySleep.ahk

; Sleep for exactly 45ms
ySleep(45)
```

### Parameters

| Param | Type | Description |
|-------|------|-------------|
| `sTime` | Integer | Sleep duration in milliseconds |
| `start` | ByRef (optional) | A cached `QueryPerformanceCounter` tick to synchronize timing chains |

### Example

```autohotkey
; Sync multiple actions to a precise schedule
ySleep(100)
ySleep(50)
```

## Installation

Drop `ySleep.ahk` into your project and `#Include` it.
