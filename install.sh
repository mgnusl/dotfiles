source 'utils.sh'
source 'dotfiles.sh'


sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"

# Spotity
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list


sudo apt-get update

print_info "Installing packages..."
sudo apt-get -y install terminator vlc git htop unrar unity-tweak-tool nodejs npm \
	compiz compizconfig-settings-manager dropbox google-chrome-stable spotify-client
print_success "Finished installing packages"

sudo apt-get -y upgrade

# Misc
echo set completion-ignore-case on | sudo tee -a /etc/inputrc  # Case insensitive shell
print_success "Changed system settings"

mkdir ~/git
rm -rf ~/Documents
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Videos
rm -rf ~/Music
print_success "Removed and created folders"


# System settings
gsettings set com.canonical.indicator.power show-percentage true
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'
print_success "Changed system settings"


# Install dotfiles
install_dotfiles


print_heading ""
print_heading "=========================================="
print_heading " INSTALLATION COMPLETE. TIME FOR A REBOOT "
print_heading "=========================================="
print_heading ""