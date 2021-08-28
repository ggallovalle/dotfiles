# ----------------- asdf -----------------------
set -x ASDF_DATA_DIR $XDG_DATA_HOME/asdf
if test -f "$ASDF_DATA_DIR/asdf.fish"
    source $ASDF_DATA_DIR/asdf.fish
    source $ASDF_DATA_DIR/plugins/java/set-java-home.fish
else
    msg -w "asdf not installed"
end
# ----------------- golang -----------------------
set -x GOPATH $XDG_DATA_HOME/go
set -x GOBIN $GOPATH/bin
set -p PATH $GOBIN
# ----------------- android -----------------------
set -x ANDROID_SDK_ROOT $XDG_DATA_HOME/androidsdk # avdmanager, sdkmanager
set -a PATH $ANDROID_SDK_ROOT/tools/bin # adb, logcat
set -a PATH $ANDROID_SDK_ROOT/platform-tools
set -a PATH $ANDROID_SDK_ROOT/emulator
# ----------------- nodejs    -------------------------
# ----------------- volta    -------------------------
set -gx VOLTA_HOME "$HOME/.volta"
set -a PATH "$VOLTA_HOME/bin"
set -p PATH "$VOLTA_HOME/tools/image/yarn/1.22.10/bin"
# ----------------- java    -------------------------
source $ASDF_DATA_DIR/plugins/dotnet-core/set-dotnet-home.fish
source $ASDF_DATA_DIR/plugins/java/set-java-home.fish
# ----------------- lua    -------------------------
eval (luarocks path)
