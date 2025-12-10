#!/bin/bash

# Actualitzar paquets i instal·lar BIND9
apt update
apt upgrade -y
apt install bind9 -y

# URL RAW del teu repositori GitHub
BASE_URL="https://raw.githubusercontent.com/MateuLlabres252/DNS/main"

# Descarregar fitxers (sense punts finals!)
curl -sSL "$BASE_URL/named.conf.local" -o "/etc/bind/named.conf.local"
curl -sSL "$BASE_URL/db.granalmacen.org" -o "/var/lib/bind/db.granalmacen.org"
curl -sSL "$BASE_URL/db.xarxaadmin.granalmacen.org" -o "/var/lib/bind/db.xarxaadmin.granalmacen.org"
curl -sSL "$BASE_URL/db.inversa" -o "/var/lib/bind/db.inversa"
# Reiniciar servei DNS
systemctl restart bind9
systemctl status bind9
