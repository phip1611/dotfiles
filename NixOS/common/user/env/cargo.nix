# Enables a convenient development environment for cargo/rust.
# This includes that `cargo install|uninstall <package>` works
# within the typical `~/.cargo/bin` directory.

username:

{ pkgs, lib, config, options, ... }:

let
  cfg = config.phip1611.common.user.env;

  # List of binaries to create a symlink to in `~/.cargo/bin`.
  # From my testing, adding "cargo" and "rustc" should be enough, but better
  # be safe.
  cargoSymlinkBins = [
    "cargo"
    "cargo-clippy"
    "rustc"
    "rustdoc"
    "rustfmt"
    "rustup"
  ];

  # Function that creates a list of cargo symlinks for the home-manager.
  createCargoBinSymlinks = mkOutOfStoreSymlink: bins: builtins.foldl'
    (acc: bin: {
      ".cargo/bin/${bin}".source = mkOutOfStoreSymlink "/etc/profiles/per-user/${username}/bin/${bin}";
    } // acc)
    { } # accumulator
    bins;
in
{
  config = lib.mkIf (cfg.enable && !cfg.excludeGui) {

    home-manager.users."${username}" = { pkgs, config, ... }: {
      home.file = createCargoBinSymlinks config.lib.file.mkOutOfStoreSymlink cargoSymlinkBins;

      # Add tools installed via cargo to the end of $PATH.
      # This gives those binaries the lowest precedence in $PATH.
      home.sessionPath = [
        "/home/${username}/.cargo/bin"
      ];
    };
  };
}