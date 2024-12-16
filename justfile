default: build flash

init:
    git clone https://github.com/qmk/qmk_firmware.git
    
flash:
    dfu-util -a 0 --dfuse-address 0x08000000:leave -D firmware.bin -w

build:
    podman run --rm -it --replace \
    --name qmk-compile \
    -v ./qmk_firmware:/qmk_firmware:z \
    -v .:/mount:z \
    ghcr.io/qmk/qmk_cli \
    qmk compile -t /mount/firmware.bin /mount/keymap.json