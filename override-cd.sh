#!/bin/bash
cd() {
    # Jeśli podany argument to same kropki
    if [[ "$1" =~ ^\.+$ ]]; then
        local count=${#1}

        if (( count <= 1 )); then
            builtin cd "$@"   # normalne cd . lub cd bez argumentów
            return
        fi

        # Zbuduj ścieżkę ../..../.. (count-1 razy ..)
        local path=""
        for ((i=1; i < count; i++)); do
            path+="../"
        done

        builtin cd "$path" 2>/dev/null || builtin cd /
    else
        # w innym przypadku działaj jak normalne cd
        builtin cd "$@"
    fi
}
