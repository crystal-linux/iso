#!/bin/bash

printf "Ver: "
read VER

gh release create $VER
gh release upload $VER *.iso
