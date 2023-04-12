Some minimal valid NixOS config used to perform a NixOS build in CI. The
`configuration.nix` includes the modules to test from "/NixOS" and tests them
this way. To test only means that configuration properties are valid and the
NixOS build succeeds. There is no runtime test.
