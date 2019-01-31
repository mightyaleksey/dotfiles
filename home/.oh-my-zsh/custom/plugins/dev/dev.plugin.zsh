# https://github.com/rupa/z
source /usr/local/etc/profile.d/z.sh

# git helper for switching user email
gt() {
  case "$1" in
    "u") git config --global user.email;;
    "h") git config --global user.email "iamhoneyboy@gmail.com";;
    "w") git config --global user.email "sullenor@yandex-team.ru";;
    *)
      echo "$ gt <command>"
      echo
      echo "Commands:"
      echo "  u   print user email"
      echo "  h   set user email to gmail"
      echo "  w   set user email to y-t"
      ;;
  esac
}

# simple shortcut for the static server
# www() {
#   python -m SimpleHTTPServer ${1:-1234}
# }

# helper for starting android emulator
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export ANDROID_HOME=/usr/local/share/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

open-android() {
  (cd /usr/local/share/android-sdk/tools && emulator -avd Nexus_5X_API_23 "$@");
}
