source 'utils.sh'
source 'dotfiles.sh'


# Enable 3rd party packages
sudo add-apt-repository universe
sudo add-apt-repository multiverse

# PPAs
sudo add-apt-repository -y ppa:nathan-renniewaldock/flux

sudo apt-get update

print_info "Installing packages..."
sudo apt-get -y install terminator vlc git htop unrar curl unity-tweak-tool nodejs npm compiz compizconfig-settings-manager vim fluxgui
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
gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false 	# Disable Dash 'More suggestions' section
gsettings set com.canonical.indicator.bluetooth visible false				# Hide bluetooth icon from the toolbar		
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'
echo set completion-ignore-case on | sudo tee -a /etc/inputrc  				# Case insensitive shell
print_success "Changed system settings"


# Font
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash
print_success "Installed font"


# Node packages
sudo npm install -g npm-check-updates n


install_dotfiles


print_heading ""
print_heading "=========================================="
print_heading " INSTALLATION COMPLETE. TIME FOR A REBOOT "
print_heading "=========================================="
print_heading ""
