#!/bin/sh

# add backports to apt and install emacs (to get emacs 29)
printf "\n\n# Add Debian Backports:\ndeb http://deb.debian.org/debian bookworm-backports main\n" >> /etc/apt/sources.list
apt-get update
apt install -t bookworm-backports emacs


# Install basic packages:
printf "Installing basic packages..."
apt-get -y --ignore-missing install $(< basic-packages.list)

# Install common packages:
# printf "Installing common packages..."
# Apt-get -y --ignore-missing install $(< common-packages.list)

# Change shell:
if grep -q /bin/zsh /etc/shells; then
    chsh /bin/zsh ewhd
    printf "\nShell changed to zsh\n"
fi

#EOF
