#!/usr/bin/env python3
from . import *
from .common import *


if __name__ == '__main__':
    objs = [
        NodeMCURelayCase()
    ]

    for obj in objs:
        print('Rendering {}...'.format(obj.name()))
        scad_render_to_file(
            obj.render(),
            filepath="out/{}.scad".format(obj.name()),
            file_header=f'$fn = 180;',
            include_orig_code=False
        )
