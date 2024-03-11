#!/bin/bash
# Get Ubuntu version
declare repo_version=$(if command -v lsb_release &> /dev/null; then lsb_release -r -s; else grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"'; fi)

# Download Microsoft signing key and repository
wget https://packages.microsoft.com/config/ubuntu/$repo_version/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

pwd

# Install Microsoft signing key and repository
sudo dpkg -i packages-microsoft-prod.deb

# Clean up
rm packages-microsoft-prod.deb
sudo cp ./99microsoft-dotnet.pref /etc/apt/preferences.d/

# Update packages
sudo apt update

sudo apt install aspnetcore-runtime-8.0
sudo apt install dotnet-runtime-8.0
sudo apt install dotnet-sdk-8.0

sudo apt-get install mono-complete
wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe

mkdir ~/adsrouter

cd ~/adsrouter
dotnet new console
dotnet add package Beckhoff.TwinCAT.Ads.TcpRouter --version 6.1.197
dotnet add package Beckhoff.TwinCAT.Ads --version 6.1.197