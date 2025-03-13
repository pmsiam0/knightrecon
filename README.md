# KnightRecon

This Bash script automates the process of subdomain enumeration, resolution, permutation, and vulnerability scanning for bug bounty and penetration testing. It sequentially runs multiple recon tools to discover subdomains, resolve them, and identify potential security issues using Nuclei.


# Features
✅ Passive Subdomain Enumeration – Uses Amass, Subfinder, Assetfinder, Findomain, GAU, Waybackurls, and GitHub-Subdomains.

✅ Subdomain Resolution – Resolves valid subdomains using PureDNS with a public resolvers list.

✅ Subdomain Permutation – Generates subdomain mutations with Gotator for deeper enumeration.

✅ Automated Vulnerability Scanning – Uses Nuclei to detect common security issues. Even though you can add more.

# Requirements
1. Ubuntu/Debian-based OS (or modify it for other distros)
2. Go environment (installed automatically if missing)
3. Python3 and pip3
4. Complete your subfinder and amass configuration.

# Why Use This Script?
✅ Saves time – Installs all tools in one go.

✅ Ensures dependencies are installed – No more missing tools.

✅ Keeps tools updated – Installs the latest versions.

# Installation & Usage Script for KnightRecon

```
git clone https://github.com/pmsiam0/knightrecon.git
cd knightrecon
chmod +x automate.sh
./automate.sh
```

# Disclaimer
Usage of this program for attacking targets without consent is illegal. It is the user's responsibility to obey all applicable laws. The developer assumes no liability and is not responsible for any misuse or damage caused by this program. Please use responsibly.

The material contained in this repository is licensed under MIT.

