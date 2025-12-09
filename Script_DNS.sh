# Actualitzar paquets i instal  lar el servei DNS
apt update
apt upgrade -y
apt install bind9 -y

# Connexi   amb GitHub
BASE_URL="https://github.com/MateuLlabres252/DNS.git"

curl -sSL "$BASE_URL/named.conf.local" -o "/etc/bind/named.conf.local"
curl -sSL "$BASE_URL/db.granalmacen.org" -o "/etc/bind/db.granalmacen.org"
curl -sSL "$BASE_URL/db.xarxaadmin.granalmacen.org" -o "/etc/bind/db.xarxaadmin.granalmacen.org"
curl -sSL "$BASE_URL/db.inversa" -o "/etc/bind/db.inversa"
# Reiniciar el servei
systemctl restart bind9
systemctl status bind9
