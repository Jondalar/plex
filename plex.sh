#!/bin/bash


##################
# VDR specific stuff!
#
# make the dirs, even though the first run of plex will try to create them

if [ "/tmp/novdrbundlesyet" ]; then
  echo "no bundles, so we put them here"
  mkdir -p '/config/Library/Application Support/Plex Media Server/Plug-ins'
  mkdir -p '/config/Library/Application Support/Plex Media Server/Scanners/Movies'
  # copy the plugins to the  right place and also the scanner.py
  cp -r '/tmp/plugins/VDR.bundle' '/config/Library/Application Support/Plex Media Server/Plug-ins/'
  cp -r '/tmp/plugins/plex-yavdr-channel.bundle' '/config/Library/Application Support/Plex Media Server/Plug-ins/'
  cp '/tmp/plugins/VDR.bundle/Scanners/Movies/VDR Recordings Scanner.py' '/config/Library/Application Support/Plex Media Server/Scanners/Movies'
  # set +x to allow plex to run the plugins
  chmod a+x '/config/Library/Application Support/Plex Media Server/Plug-ins/VDR.bundle/Contents/Code/__init__.py'
  chmod a+x '/config/Library/Application Support/Plex Media Server/Plug-ins/plex-yavdr-channel.bundle/Contents/Code/__init__.py'
  chmod a+x '/config/Library/Application Support/Plex Media Server/Scanners/Movies/VDR Recordings Scanner.py'
  chown -R plex:plex /config/Library
  touch /config/yavdrplugins_installed
  ##################
  rm /tmp/novdrbundlesyet

fi

# usual start of the plex application
exec /sbin/setuser plex /usr/sbin/start_pms
