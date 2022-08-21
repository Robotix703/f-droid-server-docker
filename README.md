# f-droid-server-docker
F-droid server for personnal use (Docker)

# Requirement
Il faut copier les fichiers APK dans le folder /fdroid

Il faut copier le fichier config.yml dans le folder /fdroid

Il faut copier le fichier mainKeystore dans le folder /private

# Key Generation
Il faut générer les clé dans le dossier /private

keytool -genkey -v -keystore mainKeystore -alias mainKey -keyalg RSA -keysize 2048 -validity 10000

# Ajouter APK
Copier l'APK dans le dossier /unsigned
Créer un fichier <nomAPK>.yml dans le dossier /metadata