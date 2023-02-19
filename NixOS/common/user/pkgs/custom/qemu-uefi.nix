{ writeShellScriptBin, qemu, OVMF }:

# Wrapper around "qemu-system-x86_64" that uses OVMF as UEFI firmware.
writeShellScriptBin "qemu-uefi" ''
  exec ${qemu}/bin/qemu-system-x86_64 \
        -machine q35,accel=kvm -cpu host -bios ${OVMF.fd}/FV/OVMF.fd \
        -m 2048 -display none -serial stdio "$@"
''
