function pacman.rm -a package -w "pacman -Rns" -d "Remove a package and see information before"
    if pacman -Qi $package
        if __io__read_confirm
            sudo pacman -Rns $package
        end
    end
end