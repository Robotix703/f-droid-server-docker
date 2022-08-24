# f-droid-server-docker
F-droid server for personnal use (Docker)

# Requirement
## Dossier private
Il faut y copier le fichier config.yml après avoir remplacé les mots de passe
Il faut y copier le fichier mainKeystore

## Dossier metadata
Il faut y copier un fichier <nomAPK>.yml contenant le nom de l'APK de chaque application

## Dossier /usr/src/APK
Il faut y copier les fichiers APK de toutes les applications

# Key Generation
Il faut générer les clé dans le dossier /private

keytool -genkey -v -keystore mainKeystore -alias mainKey -keyalg RSA -keysize 2048 -validity 10000

# Fichier de configuration
Il faut ajouter dans le keyaliases un emplacement pour chaque applications comme ci-dessous

keyaliases:
  firstAPP: repokey