FROM ubuntu:22.04

#Install required software
RUN apt-get update && apt-get upgrade --yes
RUN apt-get install software-properties-common --yes
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

#Install nginx
RUN apt-get install nginx --yes

#Install fdroid server
RUN add-apt-repository ppa:fdroid/fdroidserver
RUN	apt-get update
RUN	apt-get install fdroidserver --yes

#Add elements to f-droid
RUN mkdir /usr/src/android-sdk-linux
WORKDIR /usr/src/fdroid
	
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
RUN unzip commandlinetools-linux-6858069_latest.zip

RUN export ANDROID_HOME="$HOME/android-sdk-linux"
RUN ./cmdline-tools/bin/sdkmanager --sdk_root="$ANDROID_HOME" platform-tools "build-tools;30.0.3"

#Create directories
RUN mkdir -p /usr/share/nginx/www/fdroid
WORKDIR /usr/share/nginx/www/fdroid

#Init
RUN export ANDROID_HOME="$HOME/android-sdk-linux" \ 
	fdroid init

#Copy logo
COPY ./logo.png .

#Create folders
RUN mkdir repo
RUN mkdir unsigned
RUN mkdir private
RUN mkdir metadata
RUN mkdir /usr/APK

#Copy nginx config
COPY nginx.conf /etc/nginx/

#Clear
RUN apt-get clean

#Expose
EXPOSE 80

#Setup entrypoint
COPY compileAPK.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/compileAPK.sh
ENTRYPOINT ["/bin/bash"]