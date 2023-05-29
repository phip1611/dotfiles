{ ... }:

builtins.trace "Executing all test modules" {
  imports = [
    ./network-boot-test.nix
    ./util-overlay-test.nix
  ];
}
