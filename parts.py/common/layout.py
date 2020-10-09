#!/usr/bin/env python3
from . import *
from solid import *
from solid.utils import *
from enum import Enum


class Offset(Enum):
    BOTTOM_LEFT = (0, 0)
    BOTTOM_RIGHT = (1, 0)
    TOP_LEFT = (0, 1)
    TOP_RIGHT = (1, 1)


def align_rect(obj, width=20, height=20):
    return (obj.render() +
            translate([width, 0, 0])(obj.render()) +
            translate([width, height, 0])(obj.render()) +
            translate([0, height, 0])(obj.render()))
