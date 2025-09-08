# ----------------- asdf -----------------------
set -x ASDF_DATA_DIR $XDG_DATA_HOME/asdf
source $ASDF_DATA_DIR/asdf.fish
# ----------------- golang -----------------------
set -x GOPATH $XDG_DATA_HOME/go
set -x GOBIN $GOPATH/bin
fish_add_path $GOBIN
# ----------------- android -----------------------
set -x ANDROID_SDK_ROOT $XDG_DATA_HOME/androidsdk # avdmanager, sdkmanager
fish_add_path $ANDROID_SDK_ROOT/tools/bin # adb, logcat
fish_add_path $ANDROID_SDK_ROOT/platform-tools
fish_add_path $ANDROID_SDK_ROOT/emulator
# ----------------- dotnet    -------------------------
source $ASDF_DATA_DIR/plugins/dotnet-core/set-dotnet-home.fish
fish_add_path $HOME/.dotnet/tools
# ----------------- java    -------------------------
source $ASDF_DATA_DIR/plugins/java/set-java-home.fish
# ----------------- lua    -------------------------
# eval (luarocks path)
# ----------------- nim    -------------------------
fish_add_path $HOME/.nimble/bin
