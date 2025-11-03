# ~/.config/fish/config.fish

# -------------------------------
# PATH
# -------------------------------
# set -gx PATH $HOME/.cargo/bin $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin $HOME/go/bin /bin /usr/local/sbin /usr/local/bin /usr/bin /opt/bin /usr/lib/llvm/20/bin /opt/cuda/bin  /home/niko/src/zls/zig-out/bin/ /home/niko/.local/bin /home/niko/.spicetify $PATH




set -gx PATH \
    $HOME/.cargo/bin \
    $HOME/.nix-profile/bin \
    /nix/var/nix/profiles/default/bin \
    $HOME/go/bin \
    /bin \
    /usr/local/sbin \
    /usr/local/bin \
    /usr/bin \
    /opt/bin \
    /usr/lib/llvm/20/bin \
    /opt/cuda/bin \
    /home/niko/.local/bin \
    /home/niko/.spicetify


# -------------------------------
# ENVS
# -------------------------------
set -gx GOCACHE $HOME/.cache/go-build
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
set -gx QT_QPA_PLATFORMTHEME gtk3
set -gx GDK_BACKEND wayland
set -gx EDITOR nvim
set -gx SAL_USE_VCLPLUGIN gtk3
set -gx NVM_DIR $HOME/.nvm




# -------------------------------
# ALIAS
# -------------------------------
alias gs "git status"
alias gl "git log --oneline --graph --decorate"
alias ga "git add ."
alias gc "git commit"
alias gcb "git checkout -b"
alias gco "git checkout"
alias gb "git branch"
alias gundo "git reset --soft HEAD~1"
alias gbr "git branch -r"
alias gpl "git pull"
alias doom "$HOME/.config/emacs/bin/doom"
alias disk "sudo smartctl -a"
alias size-folder "du -sh"
alias need-for "equery h"
alias equery_versions "equery list -po"
alias gentoo-gc "sudo eclean-dist --deep"
alias update "sudo emerge -avtDNUu @world"
alias grub-update "sudo grub-mkconfig -o /boot/grub/grub.cfg"
function gentoo-package-size
    qsize -v --nocolor | awk '{
        for (i=1; i<=NF; i++) {
            if ($i ~ /^[0-9.]+[KMG]$/) {
                size=$i
                unit=substr(size, length(size))
                val=substr(size, 1, length(size)-1)
                if (unit=="K") val/=1024
                else if (unit=="G") val*=1024
                sum+=val
            }
        }
    }
    END {printf "Total size: %.2f MB (%.2f GB)\n", sum, sum/1024}'
end

alias cleanup "sudo rm -rf /var/tmp/portage/*
sudo rm -rf /var/cache/distfiles/*
sudo rm -rf /var/cache/binpkgs/*
"


# Docker
alias dockerd-start "sudo rc-service docker start"
alias docker-start "sudo rc-service docker start"
alias dockerd-stop "sudo rc-service docker stop"
alias dockerd-restart "sudo rc-service docker restart"
alias dps "docker ps"
alias dpsa "docker ps -a"
alias dimg "docker images"
alias drm "docker rm -f"
alias drmi "docker rmi"
alias dexec "docker exec -it"
alias dlogs "docker logs -f"

# Gentoo helpers
alias emerge-search "equery list"
alias emerge-info "equery uses"
alias emerge-files "equery files"
alias emerge-deps "equery depgraph"
alias etc-update "sudo etc-update"
alias eqd "equery depends"
alias equ "equery uses"
alias eqg "equery g"
alias epkg "emerge -pv"
alias esync "emerge --sync"
alias emc "emerge --depclean"
alias emn "emerge -avuDN @world"
alias emr "emerge --deselect"
alias eixi "eix --installed"
alias image "qimgv"

# Misc
alias calendar "calcurse"
alias firefox "/usr/bin/firefox-bin"
alias ls "lsr"


# -------------------------------
# NVM (Node Version Manager)
# -------------------------------
if test -s "$NVM_DIR/nvm.sh"
    source "$NVM_DIR/nvm.sh"
end
if test -s "$NVM_DIR/bash_completion"
    source "$NVM_DIR/bash_completion"
end

# -------------------------------
# Fish greeting
# -------------------------------
set fish_greeting

