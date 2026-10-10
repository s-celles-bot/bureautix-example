# SPDX-FileCopyrightText: 2026 Sébastien Celles <s.celles@gmail.com>
#
# SPDX-License-Identifier: MIT

# Hardening that holds whatever Sécurix revision is pinned.
{ lib, ... }:
{
  # Remote access is for the super administrators' SSH keys only
  # (./superadmins.nix): no password nor keyboard-interactive login, which
  # older Sécurix revisions leave enabled.
  services.openssh.settings = {
    PasswordAuthentication = false;
    KbdInteractiveAuthentication = false;
  };

  # Boot entries cannot be edited from the boot menu, and a bounded number of
  # generations stays installed (rollback remains possible).
  boot.lanzaboote = {
    settings.editor = false;
    configurationLimit = lib.mkDefault 10;
  };
}
