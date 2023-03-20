#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s ${BASEDIR}/terminator ~/.config/
ln -s ${BASEDIR}/nvim ~/.config/
ln -s ${BASEDIR}/.zshrc ~/.zshrc
ln -s ${BASEDIR}/firefox/userChrome.css ~/.mozilla/firefox/i4w5yjyy.default-release/chrome/userChrome.css
ln -s ${BASEDIR}/kitty ~/.config/
ln -s ${BASEDIR}/ulauncher ~/.config/
