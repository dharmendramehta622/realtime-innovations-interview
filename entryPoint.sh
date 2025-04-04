#!/bin/bash

# TODO - PUB GET
flutter clean
flutter pub get
cd packages/common_widget && flutter pub get
echo 'Pub get successfully executed in common_widget package.'
cd .. && cd packages/mainapp && flutter pub get
echo 'Pub get successfully executed in mainapp package.'
echo 'Pub get successfully executed in project.'
# TODO - ENDOF PUB GET
