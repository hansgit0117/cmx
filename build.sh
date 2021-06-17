#!/bin/bash 
#
# Copyright (c) 2020 .
#

PATH_PROJECT=$(pwd)
#APP_NAME=${PWD##*/}
APP_NAME="home_services_ui_kit"

# build apk
flutter clean
flutter pub get
flutter build apk --release
# flutter build appbundle --target-platform android-arm,android-arm64,android-x64

# move file app-release.aab to folder certs
cp "$PATH_PROJECT/build/app/outputs/flutter-apk/app-release.apk" "$PATH_PROJECT/$APP_NAME.apk"
# cp "$PATH_PROJECT/build/app/outputs/bundle/release/app-release.aab" "$PATH_PROJECT/$APP_NAME.aab"