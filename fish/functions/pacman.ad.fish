function pacman.ad -a package -w "pacman -Si" -d "Add a package and see information before"
    if pacman -Si $package
        if __io__read_confirm
            sudo pacman -S $package
        end
    else
        if yay -Si $package
            if __io__read_confirm
                yay $package
            end
        end
    end
end