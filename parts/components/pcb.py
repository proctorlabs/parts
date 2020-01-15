#!/usr/bin/env python3
from ..common import *


class PCB(ScadBase):
    def __init__(self, thickness=1.5, width=20, length=40,
                 mount_positions=[], mount_radius=0, pin=None):
        super().__init__()
        self.thickness = thickness
        self.width = width
        self.length = length
        self.mount_positions = mount_positions
        self.mount_radius = mount_radius
        self.pin = pin

    def name(self):
        return 'PCB'

    def render(self):
        pcb = color('green')(cube([self.width, self.length, self.thickness]))
        for mnt in self.mount_positions:
            (x, y) = (mnt[0], mnt[1])
            if (x < 0):
                x = self.width + x
            if (y < 0):
                y = self.length + y
            pcb = pcb - \
                translate([x, y, -0.01])(
                    cylinder(r=self.mount_radius, h=self.thickness + 0.02))
            if (self.pin):
                pcb = pcb + \
                    translate([x, y, 0 - self.pin.base_height]
                              )(color('Silver')(self.pin.render()))

        return pcb
