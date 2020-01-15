setup:
    @echo 'Preparing system requirements...'
    pip3 install -r requirements.txt
    yay -S watchexec --noconfirm

watch:
    @echo 'Regenerating SCAD files on change...'
    watchexec -e py -r -i __pycache__ -c just generate

generate:
    #!/usr/bin/env sh
    echo "Regenerating all parts..."
    python3 -m parts
    echo 'Files generated, opening openscad if needed'
    (pgrep -x openscad -c > /dev/null) || (openscad out/test.scad &)
    echo 'Done!'
