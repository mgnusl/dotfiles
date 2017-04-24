source 'utils.sh'
source 'dotfiles.sh'

PPAS = "ppa:nathan-renniewaldock/flux"
APT_PACKAGES = "terminator vlc git htop unrar curl unity-tweak-tool nodejs npm compiz compizconfig-settings-manager vim fluxgui"
NODE_PACKAGES = "npm-check-updates"


sudo add-apt-repository -y $PPAS

sudo apt-get update

print_info "Installing packages..."
sudo apt-get -y install $APT_PACKAGES
print_success "Finished installing packages"

sudo apt-get -y upgrade

# Create folders and remove annoying default folders
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


# Node packages
npm install -g $NODE_PACKAGES


install_dotfiles


print_heading ""
print_heading "=========================================="
print_heading " INSTALLATION COMPLETE. TIME FOR A REBOOT "
print_heading "=========================================="
print_heading ""
