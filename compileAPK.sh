#Clear repo folder
cd /usr/share/fdroid/repo
rm * -r

#Copy APK
cp /usr/src/APK/*.apk /usr/share/fdroid/unsigned
#Copy config file
cp /usr/share/fdroid/private/config.yml /usr/share/fdroid

#Go to fdroid folder
cd /usr/share/fdroid

#Sign APK
fdroid publish --verbose

#Run fdroid update
fdroid update --create-metadata

#Give acces to repo folder
chmod -R 755 /usr/share/fdroid/repo

#Start nginx server
/etc/init.d/nginx start

#Keep it alive
tail -f /dev/null