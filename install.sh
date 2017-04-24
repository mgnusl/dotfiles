source 'utils.sh'
source 'dotfiles.sh'

sudo apt-get update

print_info "Installing packages..."
sudo apt-get -y install terminator vlc git htop unrar unity-tweak-tool nodejs npm \
	compiz compizconfig-settings-manager
print_success "Finished installing packages"

sudo apt-get -y upgrade


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
echo set completion-ignore-case on | sudo tee -a /etc/inputrc  # Case insensitive shell
print_success "Changed system settings"


# Font
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash
print_success "Installed font"


install_dotfiles


print_heading ""
print_heading "=========================================="
print_heading " INSTALLATION COMPLETE. TIME FOR A REBOOT "
print_heading "=========================================="
print_heading ""
