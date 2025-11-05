#!/usr/bin/env bash

# Aliases for nixos-rebuild commands
alias nx-switch='sudo nixos-rebuild switch --flake . --impure'
alias nx-test='sudo nixos-rebuild test --flake . --impure'
alias nx-boot='sudo nixos-rebuild boot --flake . --impure'

# Shortcut for "nix-collect-garbage"
nx-gc() {
    local older_than="${1:-7d}"
    sudo nix-collect-garbage -d --delete-older-than "$older_than"
    nix-collect-garbage -d --delete-older-than "$older_than"
}

# Shortcut for "home-manager switch"
nx-hm() {
    home-manager switch --flake . -b backup
}

# Shortcut for "nix run"
nx-run() {
    local pkg="$1"
    local name
    
    if [[ "$pkg" == github:* ]] || [[ "$pkg" == .* ]] || [[ "$pkg" == /* ]] || [[ "$pkg" == *#* ]]; then
        name="$pkg"
    else
        name="nixpkgs#$pkg"
    fi
    
    nix run "$name"
}

# Shortcut for "nix search"
nx-search() {
    local name="$1"
    nix search nixpkgs "$name" --json | jq -r 'keys[]' | while read -r key; do
        echo "$key" | awk -F'.' '{
            n = NF - 2
            if (n > 0) {
                for (i=1; i<=n; i++) {
                    printf "%s", $i
                    if (i < n) printf "."
                }
                print ""
            }
        }'
    done
}

# Shortcut for "nix shell"
nx-shell() {
    local -a pkgs=()
    
    for pkg in "$@"; do
        if [[ "$pkg" == github:* ]] || [[ "$pkg" == .* ]] || [[ "$pkg" == /* ]] || [[ "$pkg" == *#* ]]; then
            pkgs+=("$pkg")
        else
            pkgs+=("nixpkgs#$pkg")
        fi
    done
    
    echo "${pkgs[@]}"
    nix shell "${pkgs[@]}"
}

# Main nx function dispatcher
nx() {
    local subcommand="$1"
    shift
    
    case "$subcommand" in
        switch)
            sudo nixos-rebuild switch --flake . --impure "$@"
            ;;
        test)
            sudo nixos-rebuild test --flake . --impure "$@"
            ;;
        boot)
            sudo nixos-rebuild boot --flake . --impure "$@"
            ;;
        gc)
            nx-gc "$@"
            ;;
        hm)
            nx-hm "$@"
            ;;
        run)
            nx-run "$@"
            ;;
        search)
            nx-search "$@"
            ;;
        *)
            # If no recognized subcommand, treat as nix shell
            nx-shell "$subcommand" "$@"
            ;;
    esac
}

# Push private vault repo to remote
vault() {
    cd ~/Vault || return
    git add .
    git commit -m "sync $(date '+%Y-%m-%d %H:%M')"
    git push
}

# Core dump debugging
coredump() {
    nix shell nixpkgs#gdb -c coredumpctl gdb -1
}