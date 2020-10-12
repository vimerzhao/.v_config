# 命令封装，提高效率
# ADB
alias v_adb_current_activity="adb shell dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'"
alias v_adb_activity_stack="adb shell dumpsys activity activities | sed -En -e '/Stack #/p' -e '/Running activities/,/Run #0/p'"
alias v_adb_deeplink="adb shell am start -a android.intent.action.VIEW -d"
alias v_adb_screen_record="adb shell screenrecord //mnt/sdcard/demo.mp4"
alias v_adb_pull_record="adb pull //mnt/sdcard/demo.mp4"
alias v_adb_screen_cap="adb shell /system/bin/screencap -p /sdcard/screenshot.png && adb pull /sdcard/screenshot.png"
alias v_adb_push_all_to_photon="adb push * /sdcard/Android/data/com.tencent.android.qqdownloader/files/tassistant/photondebug"
alias v_adb_kill="adb shell am force-stop"


# 环境变量配置，尽可能保持每台设备一致
# 后面要保持命名一致，主要有：
#   配置目录： ~/.v_config
#   自有工具： ~/.v_tools
#   安装目录： ~/.install
export user="vimerzhao"
export PATH=$PATH:/Users/$user/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/$user/.install/flutter/bin
export PATH=$PATH:/Users/$user/.install/jetifier-standalone/bin
export PATH=$PATH:/Users/$user/.v_tools/jadx/bin


# For Office Wifi
# where proxy
proxy () {
  export http_proxy=127.0.0.1:12639
  # 这里不要加 https:// 的前缀，不然mac上直接报错 -> curl: (35) error:1400410B:SSL routines:CONNECT_CR_SRVR_HELLO:wrong version number
  export https_proxy=127.0.0.1:12639
  #export ALL_PROXY=https://127.0.0.1:12639
  echo "HTTP Proxy on"
}

# where noproxy
noproxy () {
  unset http_proxy
  unset https_proxy
  unset ALL_PROXY
  echo "HTTP Proxy off"
}

git-proxy() {
    git config --global http.proxy http://127.0.0.1:12639
    git config --global https.proxy https://127.0.0.1:12639
}

git-no-proxy() {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

# For 微视
alias weishi_goto_setting="adb shell am start -a android.intent.action.VIEW -d weishi://setting"
alias weishi_goto_flutter_debug="adb shell am start -n com.tencent.weishi/com.tencent.oscar.module.settings.debug.FlutterDebugActivity"
