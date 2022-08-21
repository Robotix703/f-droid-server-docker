#Clear repo folder
cd /usr/share/nginx/www/fdroid/repo
rm * -r
cp /usr/APK/*.apk /usr/share/nginx/www/fdroid/unsigned

#Go to fdroid folder
cd /usr/share/nginx/www/fdroid

#Sign APK
fdroid publish --verbose

#Run fdroid update
fdroid update --create-metadata

#Give acces to repo folder
chmod -R 755 /usr/share/nginx/www/fdroid/repo

#Start nginx server
/etc/init.d/nginx start

#Keep it alive
tail -f /dev/null