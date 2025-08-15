#!/bin/bash


install_if_missing() {
  command -v $1 >/dev/null 2>&1 || {
    echo "$1 is not installed. Installing..."
    sudo apt-get install -y $2
  }
}


install_if_missing "git" "git"
install_if_missing "go" "golang"
install_if_missing "pip3" "python3-pip"
install_if_missing "unzip" "unzip"
install_if_missing "wget" "wget"

go install -v github.com/owasp-amass/amass/v3/...@master

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

go install github.com/tomnomnom/assetfinder@latest
go install github.com/tomnomnom/unfurl@latest

wget -N -c https://github.com/Findomain/Findomain/releases/download/9.0.0/findomain-linux.zip
unzip findomain-linux.zip
mv findomain /usr/local/bin/findomain
chmod 755 /usr/local/bin/findomain

go install github.com/lc/gau/v2/cmd/gau@latest

go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/gwen001/github-subdomains@latest

go install github.com/tomnomnom/anew@latest

git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
sudo make install
cd ..
go install github.com/d3mondev/puredns/v2@latest

git clone https://github.com/vortexau/dnsvalidator.git
cd dnsvalidator/
pip3 install -r requirements.txt
pip3 install setuptools==58.2.0
python3 setup.py install
cd ..

wget https://gist.githubusercontent.com/six2dez/ffc2b14d283e8f8eff6ac83e20a3c4b4/raw

go install -v github.com/Josue87/gotator@latest

echo "All tools installed successfully"
