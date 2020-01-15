#!/usr/bin/env python3
from ..common import *


class SnapPin(ScadBase):
    def __init__(self, base_height=5, base_radius=10, pin_height=10, pin_radius=5):
        super().__init__()
        self.base_height = base_height
        self.base_radius = base_radius
        self.pin_height = pin_height
        self.pin_radius = pin_radius

    def name(self):
        return 'Snap Pin'

    def render(self):
        return cylinder(r=self.base_radius, h=self.base_height) + cylinder(r=self.pin_radius, h=self.pin_height)
