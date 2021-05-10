#!/bin/bash

echo "Starting vagrant, and ensuring plugin"
vagrant plugin install vagrant-scp
echo "Handing to vagrant"
vagrant up
