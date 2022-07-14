
# Update your system
sudo apt-get update -y

# Install some basic essentials
sudo apt-get install build-essential -y

# Get the curl downloader
sudo apt install apt-transport-https curl -y

# Install the brave browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install brave-browser -y

# Setup rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Setup HTOP
sudo apt-get install htop -y

# Setup bat
sudo apt-get install bat -y

# Setup duf
sudo apt-get install duf -y

# Install dust
brew tap tgotwig/linux-dust && brew install dust

# Installing homebrew
sudo apt-get install homebrew -y

# Install pacstall
sudo apt-get install pacstall -y

# Download and install miniconda
function _install_miniconda() {
    wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ${INSTALLER_PATH}
    chmod +x ${INSTALLER_PATH}
    ${INSTALLER_PATH} -b -p ${INSTALL_PREFIX}
    rm ${INSTALLER_PATH}
    ${INSTALL_PREFIX}/bin/conda upgrade -y --all
    ${INSTALL_PREFIX}/bin/conda clean -ya
    ${INSTALL_PREFIX}/bin/conda install -y conda-build conda-verify
}
_install_miniconda


# install zoxide
conda activate base
conda install -c conda-forge zoxide

# Install TLDR for man pages
pip install tldr

# Install sshpass
sudo apt-get install sshpass -y
sudo apt-get install openssh-server ssh-client -y

# Install anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list

# Write anydesk
sudo apt-get update
sudo apt-get upgrade -y
sudo apt --fix-broken install
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# Setup net tools
sudo apt-get install net-tools -y

# Install stretchly
sudo apt-get install stretchly -y

# Install gnome-tweaks
sudo apt-get install gnome-tweaks -y


# Install docker
#https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-engine---community-1
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io


#Install nvidia container runtime
#https://github.com/NVIDIA/nvidia-docker/tree/master#upgrading-with-nvidia-docker2-deprecated
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update 
sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker


# Setup git
echo "Setting up git"
git config --global color.ui true
git config --global user.name "geeks-sid"
git config --global user.email "sid.cre8er@gmail.com"
ssh-keygen -t rsa -b 4096 -C "sid.cre8er@gmail.com"
cat ~/.ssh/id_rsa.pub
echo "Copy the above ssh key and paste it at https://github.com/settings/keys"


# Setup the tmux
sudo apt update
sudo apt install -y git automake build-essential pkg-config libevent-dev libncurses5-dev byacc
git clone https://github.com/tmux/tmux.git temp-tmux
cd temp-tmux
git checkout tags/2.9a
sh autogen.sh
./configure && make
sudo make install
cd -
rm -fr temp-tmux

# Setup something else
