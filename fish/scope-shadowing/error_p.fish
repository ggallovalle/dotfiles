function error_p -S
    test $errors -eq 0
    and return 0
    or return 1
end
