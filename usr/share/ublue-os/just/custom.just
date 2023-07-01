!include /usr/share/ublue-os/just/bling.just

skel-to-home:
  rsync -avh /etc/skel "$HOME"