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
set -gx GOTELEMETRY off


# -------------------------------
# ALIAS
# -------------------------------

function gs      ; git status $argv               ; end
function gl      ; git log --oneline --graph --decorate $argv ; end
function ga      ; git add . $argv                 ; end
function gc      ; git commit $argv                ; end
function gcb     ; git checkout -b $argv           ; end
function gco     ; git checkout $argv             ; end
function gb      ; git branch $argv                ; end
function gundo   ; git reset --soft HEAD~1 $argv   ; end
function gbr     ; git branch -r $argv            ; end
function gpl     ; git pull $argv                 ; end
function git-sync   ; git fetch origin && git rebase origin/main $argv ; end
function git-merge  ; git fetch origin && git merge origin/main $argv ; end
function git-log-reverse ; git log --oneline --reverse $argv ; end
function git-revert-commit ; git revert -n $argv   ; end
function gt-substatus ; git submodule status $argv ; end
function disk         ; sudo smartctl -a $argv         ; end
function disk-health  ; sudo smartctl -aH $argv        ; end
function size-folder  ; du -sh $argv                   ; end
function cleanup ;
    sudo rm -rf /var/tmp/portage/*
    sudo rm -rf /var/cache/distfiles/*
    sudo rm -rf /var/cache/binpkgs/*
end
function need-for       ; equery h $argv               ; end
function equery_versions ; equery list -po $argv       ; end
function gentoo-gc      ; sudo eclean-dist --deep $argv ; end
function update         ; sudo emerge -avtDNUu @world $argv ; end
function grub-update    ; sudo grub-mkconfig -o /boot/grub/grub.cfg $argv ; end
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


# Docker
function dockerd-start    ; sudo rc-service docker start $argv     ; end
function dockerd-stop     ; sudo rc-service docker stop $argv      ; end
function dockerd-restart  ; sudo rc-service docker restart $argv   ; end

function dps   ; docker ps $argv      ; end
function dpsa  ; docker ps -a $argv   ; end
function dimg  ; docker images $argv  ; end
function drm   ; docker rm -f $argv   ; end  # оставил с -f — чаще нужен
function drmi  ; docker rmi $argv     ; end
function dexec ; docker exec -it $argv ; end
function drstop ; docker stop $argv   ; end
function dlogs  ; docker logs -f $argv ; end

# Gentoo helpers
function emerge-search  ; equery list $argv           ; end
function emerge-info    ; equery uses $argv            ; end
function emerge-files   ; equery files $argv           ; end
function emerge-deps    ; equery depgraph $argv        ; end
function etc-update     ; sudo etc-update $argv        ; end
function eqd            ; equery depends $argv         ; end
function equ            ; equery uses $argv            ; end
function eqg            ; equery g $argv               ; end
function epkg           ; emerge -pv $argv             ; end
function esync          ; emerge --sync $argv          ; end
function emc            ; emerge --depclean $argv      ; end
function emn            ; emerge -avuDN @world $argv   ; end
function emr            ; emerge --deselect $argv      ; end
function eixi           ; eix --installed $argv        ; end
function image    ; qimgv $argv      ; end

# Misc
function calendar ; calcurse $argv   ; end
function firefox  ; /usr/bin/firefox-bin $argv ; end
function ls       ; lsr $argv        ; end


# -------------------------------
# Fish greeting
# -------------------------------
set fish_greeting
