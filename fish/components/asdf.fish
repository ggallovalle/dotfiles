if test -f "$ASDF_DATA_DIR/asdf.fish"
    source $ASDF_DATA_DIR/asdf.fish
else
    msg -w "asdf not installed"
end
# you can check if plugin is installed with `asdf current <plugin>`
# source $ASDF_DATA_DIR/plugins/dotnet-core/set-dotnet-home.fish
# source $ASDF_DATA_DIR/plugins/java/set-java-home.fish
