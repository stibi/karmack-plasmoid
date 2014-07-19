#!/bin/sh

zip -r ../karmack4.zip .
cd ..
plasmapkg -r karmack4
plasmapkg -i karmack4.zip
plasma-windowed karmack4
