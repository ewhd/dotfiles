#!/bin/sh

# add backports to apt and install emacs (to get emacs 29)
if ! grep -q "deb http://deb.debian.org/debian bookworm-backports main" /etc/apt/sources.list
then
    printf "\n\n# Add Debian Backports:\ndeb http://deb.debian.org/debian bookworm-backports main\n" >> /etc/apt/sources.list
    apt-get update
    apt install -t bookworm-backports emacs
else
    apt-get update
fi


# !!! Package install is still a work in progress !!!

# Install basic packages:
#printf "Installing basic packages..."
#source basic-packages.list

# Install common packages:
# printf "Installing common packages..."
# Apt-get -y --ignore-missing install $(< common-packages.list)

#sudo apt-get -y --ignore-missing install "${pkgs[@]}"

# Change shell:
if grep -q /bin/zsh /etc/shells; then
    chsh -s /bin/zsh ewhd && printf "\nShell changed to zsh\n"
fi

#EOF
