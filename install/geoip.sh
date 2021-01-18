#!/usr/bin/env bash

if [[ ! -f 'install.sh' ]]; then echo 'Where are you?'; exit 1; fi

source ./install/docker-aliases.sh

install_geoip() {
  local mmdb='geoip/GeoLite2-City.mmdb'
  local conf='geoip/GeoIP.conf'
  local result='Done'

  echo "Setting up IP address geolocation ..."
  if [[ ! -f "$mmdb" ]]; then
    echo -n "Installing (empty) IP address geolocation database ... "
    cp "$mmdb.empty" "$mmdb"
    echo "done."
  else
    echo "IP address geolocation database already exists."
  fi

  if [[ ! -f "$conf" ]]; then
    echo "IP address geolocation is not configured for updates."
    echo "See https://develop.sentry.dev/self-hosted/geolocation/ for instructions."
    result='Error'
  else
    echo "IP address geolocation is configured for updates."
    echo "Updating IP address geolocation database ... "
    if ! $dcr geoipupdate; then
      result='Error'
    fi
    echo "$result updating IP address geolocation database."
  fi
  echo "$result setting up IP address geolocation."
}

install_geoip
