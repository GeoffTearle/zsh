# arch specific config
# rate mirrors alias's
alias yay-drop-caches='sudo paccache -rk3; yay -Sc --aur --noconfirm'

alias yay-update-all='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE --protocol=https arch --max-delay=43200 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && yay-drop-caches \
      && yay'

alias yay-remove-orphans='yay -Qtdq | yay -Rns -'
