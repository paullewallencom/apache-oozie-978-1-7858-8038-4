#!/usr/bin/env bash

echo "Checking environment to install Oozie"

if [ -z $OOZIE_CODE_ENV  ]; then
        echo "Please set some environment variable to install (example export OOZIE_CODE_ENV=dev"
else
        echo "Installing Oozie code for environment $OOZIE_CODE_ENV"
fi