#!/bin/bash

# Mettre à jour les paquets du système
echo "Mise à jour des paquets..."
sudo apt-get update
sudo apt-get upgrade -y

# Installer WireGuard
echo "Installation de WireGuard..."
sudo apt-get install wireguard -y

# Création du fichier de configuration de WireGuard
echo "Création du fichier de configuration de WireGuard..."
sudo touch /etc/wireguard/wg0.conf

# Ouvrir le fichier de configuration dans un éditeur de texte
echo "Ouvrez maintenant le fichier de configuration et entrez les détails de votre VPN Firezone."
sudo nano /etc/wireguard/wg0.conf
