#!/bin/bash

echo -n "Enter the domain: "
read domain


subdomain_list="subdomains.txt"
resolved_subdomains="resolved_subdomains.txt"
nuclei_output="results.txt"

rm -f $subdomain_list $resolved_subdomains $nuclei_output



amass enum -passive -d $domain -config /root/.config/amass/config.ini -o amass_output.txt
subfinder -d $domain -all -config /root/.config/subfinder/config.yaml -o subfinder_output.txt
assetfinder --subs-only $domain > assetfinder_output.txt
findomain -t $domain -u findomain_output.txt
gau --threads 5 --subs $domain | unfurl -u domains | sort -u > gau_output.txt
waybackurls $domain | unfurl -u domains | sort -u > wayback_output.txt
github-subdomains -d $domain -t tokens.txt -o github_output.txt

cat amass_output.txt subfinder_output.txt assetfinder_output.txt findomain_output.txt gau_output.txt wayback_output.txt github_output.txt | sort -u > $subdomain_list

rm amass_output.txt subfinder_output.txt assetfinder_output.txt findomain_output.txt gau_output.txt wayback_output.txt github_output.txt

dnsvalidator -tL https://public-dns.info/nameservers.txt -threads 100 -o resolvers.txt
wget -qO - https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt >> resolvers.txt

puredns resolve subdomains.txt -r resolvers.txt -w bruteforce_output.txt

gotator -sub bruteforce_output.txt -perm permutations_list.txt -depth 1 -numbers 10 -mindup -adv -md | puredns resolve -r resolvers.txt > $resolved_subdomains

nuclei -l resolved_subdomains.txt -t ~/nuclei-templates/ -o $nuclei_output

