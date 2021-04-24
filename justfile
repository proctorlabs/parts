setup:
    @echo 'Preparing system requirements...'
    pip3 install -r requirements.txt
    yay -S watchexec --noconfirm

    # BOSL
    curl -sL "https://github.com/revarbat/BOSL/archive/v1.0.1.zip" > ~/.cache/bosl.zip
    unzip ~/.cache/bosl.zip -d ~/.cache/
    mv ~/.cache/BOSL-1.0.1 ~/.local/share/OpenSCAD/libraries/BOSL

    # dotSCAD
    curl -sL "https://github.com/JustinSDK/dotSCAD/archive/v2.4.zip" > ~/.cache/dotscad.zip
    unzip ~/.cache/dotscad.zip -d ~/.cache/
    mv ~/.cache/dotSCAD-2.4/src/ ~/.local/share/OpenSCAD/libraries/dotSCAD

    curl -sL "https://github.com/nophead/NopSCADlib/archive/master.zip" > ~/.cache/NopSCADlib.zip
    unzip ~/.cache/NopSCADlib.zip -d ~/.cache/
    mv ~/.cache/NopSCADlib-master/ ~/.local/share/OpenSCAD/libraries/NopSCADlib
