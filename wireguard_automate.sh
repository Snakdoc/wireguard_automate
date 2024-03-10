#!/bin/bash

# Nom du fichier contenant le résultat du playbook
fichier_resultat="resultat_playbook.txt"
# Nom du fichier où enregistrer les hôtes avec ok=0
fichier_sortie="ping_failed.txt"

# Vérifiez si le fichier de résultat existe
if [[ ! -f "$fichier_resultat" ]]; then
    echo "Le fichier $fichier_resultat n'existe pas."
    exit 1
fi

# Nettoyer ou créer le fichier de sortie
> "$fichier_sortie"

# Lire le fichier de résultat et filtrer les lignes
while IFS= read -r line; do
    if [[ $line == *" ok=0 "* ]]; then
        # Extraire le nom d'hôte
        hostname=$(echo $line | awk '{print $1}')
        # Écrire le nom d'hôte dans le fichier de sortie
        echo $hostname >> "$fichier_sortie"
    fi
done < "$fichier_resultat"

echo "Les hôtes avec ok=0 ont été enregistrés dans $fichier_sortie"
