bling:
  @just --unstable -f /usr/share/ublue-os/just/bling.just

skel-to-home:
  rsync -avh /etc/skel "$HOME"

postinstall:
  systemctl enable --now cockpit.socket sshd tailscaled
  sudo dconf update
  sudo tailscale up