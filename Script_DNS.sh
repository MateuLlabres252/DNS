# Actualizar e instalar bind9 y git
apt update
apt upgrade -y
apt install bind9 git -y

# Descargar el repositorio completo en una carpeta temporal
# (Usamos git clone porque la URL termina en .git)
rm -rf /tmp/DNS_temp
git clone https://github.com/MateuLlabres252/DNS.git /tmp/DNS_temp

# Copiar los archivos a la ruta final
cp /tmp/DNS_temp/named.conf.local /etc/bind/
cp /tmp/DNS_temp/db.granalmacen.org /etc/bind/
cp /tmp/DNS_temp/db.xarxaadmin.granalmacen.org /etc/bind/
cp /tmp/DNS_temp/db.inversa /etc/bind/

# Limpiar temporales y reiniciar
rm -rf /tmp/DNS_temp
systemctl restart bind9
systemctl status bind9
