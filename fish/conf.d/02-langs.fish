# ----------------- asdf -----------------------
set -x ASDF_DATA_DIR $XDG_DATA_HOME/asdf
source $ASDF_DATA_DIR/asdf.fish
# ----------------- golang -----------------------
set -x GOPATH $XDG_DATA_HOME/go
set -x GOBIN $GOPATH/bin
set -p PATH $GOBIN
# ----------------- android -----------------------
set -x ANDROID_SDK_ROOT $XDG_DATA_HOME/androidsdk # avdmanager, sdkmanager
set -a PATH $ANDROID_SDK_ROOT/tools/bin # adb, logcat
set -a PATH $ANDROID_SDK_ROOT/platform-tools
set -a PATH $ANDROID_SDK_ROOT/emulator
# ----------------- scala -----------------------
set -p PATH $XDG_DATA_HOME/coursier/bin
# ----------------- dotnet    -------------------------
source $ASDF_DATA_DIR/plugins/dotnet-core/set-dotnet-home.fish
set -p PATH $HOME/.dotnet/tools
# ----------------- java    -------------------------
source $ASDF_DATA_DIR/plugins/java/set-java-home.fish
# ----------------- lua    -------------------------
# eval (luarocks path)
