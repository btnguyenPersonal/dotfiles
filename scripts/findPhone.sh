#!/usr/bin/env bash
adb shell input keyevent 26
adb shell input keyevent 82
adb shell am start -a android.intent.action.VIEW -d file:///system/media/audio/ringtones/80s_Phone.ogg
