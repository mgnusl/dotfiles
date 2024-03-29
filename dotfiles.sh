#!/bin/bash
############################
# This script does the following: 
# 1. Creates symlinks from the home directory to the listed dotfiles in ~/dotfiles
# 2. Installs zsh and oh-my-zsh
# 3. Installs any listed packages
############################

source 'utils.sh'


install_zsh () {
    # Test to see if zsh is installed.  If it is:
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        # Set the default shell to zsh if it isn't currently set to zsh
        if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
            print_info "Changing shell to zsh..."
            chsh -s $(which zsh)
        fi
	git clone "https://github.com/zsh-users/antigen" ~/dotfiles/misc/antigen
    else
        # If zsh isn't installed, get the platform of the current machine
        platform=$(uname);
        # If the platform is Linux, try an apt-get to install zsh and then recurse
        if [[ $platform == 'Linux' ]]; then
            if [[ -f /etc/debian_version ]]; then
                sudo apt-get install -y zsh
                install_zsh
            fi
        # If the platform is OS X, tell the user to install zsh :)
        elif [[ $platform == 'Darwin' ]]; then
            print_error "Please install zsh, then re-run this script!"
            exit
        fi
    fi
}


install_dotfiles() {
    ########## Variables

    dir=~/dotfiles                    # dotfiles directory
    olddir=~/dotfiles_old             # old dotfiles backup directory
    files="gitconfig vimrc zshrc"     # list of files/folders to symlink in homedir

    ##########

    print_info "Installing zsh and antigen"
    install_zsh


    # Create dotfiles_old in homedir
    print_info "Creating $olddir for backup of any existing dotfiles in ~ ..."
    mkdir -p $olddir

    # Change to the dotfiles directory
    cd $dir

    # Backup any existing dotfiles in homedir to dotfiles_old directory, 
    # then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
    for file in $files; do
        print_info "Moving any existing dotfiles from ~ to $olddir"
        mv ~/.$file ~/dotfiles_old/
        print_info "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    done

    # Symlink Terminator config
    mkdir ~/.config/terminator/
    ln -s $dir/terminator-config ~/.config/terminator/config

    # Install Vundle (for Vim)
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

}
