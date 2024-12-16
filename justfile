flash:
    dfu-util -a 0 --dfuse-address 0x08000000:leave -D ../kaly_kaly42_layout_split_3x6_3_mine.bin

build:
    podman run --rm -it --replace \
        --name qmk-compile \
        -w /qmk_firmware \
        -v .:/qmk_firmware:z \
        -e QMK_USERSPACE=/qmk_userspace
        ghcr.io/qmk/qmk_cli \
        qmk setup qmk compile /qmk_firmware/keymap.json