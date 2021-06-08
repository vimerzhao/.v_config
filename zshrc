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
alias flutter-master="~/.install/flutter-master/bin/flutter"
alias flutter-stable="~/.install/flutter-stable/bin/flutter"
alias flutter-beta="~/.install/flutter-beta/bin/flutter"

# Git
alias v_git_daily_update="git add . && git commit -m 'daily update' && git push"

# 博客相关
function v_hugo_blog_new_md_post() {
    hugo new "posts/$1.adoc"
}

# 环境变量配置，尽可能保持每台设备一致
# 后面要保持命名一致，主要有：
#   配置目录： ~/.v_config
#   自有工具： ~/.v_tools
#   安装目录： ~/.install
export user="vimerzhao"
export PATH=$PATH:/Users/$user/Library/Android/sdk/platform-tools
#export PATH=$PATH:/Users/$user/.install/flutter/bin

export PATH=$PATH:/Users/$user/.install/jetifier-standalone/bin
export PATH=$PATH:/Users/$user/.install/dart-sdk/bin
export PATH=$PATH:/Users/$user/.v_tools/jadx/bin
export PATH=$PATH:/usr/local/Cellar/binutils/2.35.1/bin/

export PATH=$PATH:/Users/vimerzhao/.nvm/versions/node/v12.12.0/bin/

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
alias weishi_goto_flutter_message_container="adb shell am start -n com.tencent.weishi/com.tencent.weishi.module.msg.view.ui.FlutterContainerActivity"


# time命令增强
if [[ `uname` == Darwin ]]; then
    MAX_MEMORY_UNITS=KB
else
    MAX_MEMORY_UNITS=MB
fi
TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

# Java版本切换
export JAVA_7_HOME="$(/usr/libexec/java_home -v 1.7)"
export JAVA_8_HOME="$(/usr/libexec/java_home -v 1.8)"
export JAVA_9_HOME="$(/usr/libexec/java_home -v 9)"

alias jdk7='export JAVA_HOME=$JAVA_7_HOME'
alias jdk8='export JAVA_HOME=$JAVA_8_HOME'
alias jdk9='export JAVA_HOME=$JAVA_9_HOME'

# 默认使用JDK8
export JAVA_HOME=$JAVA_8_HOME

# Rust
source $HOME/.cargo/env

source $HOME/.afm/afm.sh
