#!/usr/bin/env python3
from . import *


class NodeMCURelayCase(ScadBase):
    case = Case(thickness=2, width=90, length=86, height=25)

    nodemcu_pin = SnapPin(base_radius=2.4, base_height=15,
                          pin_radius=1.45, pin_height=22)
    nodemcu = PCB(width=25.5, length=48.4, pin=nodemcu_pin, mount_radius=1.6,
                  mount_positions=[(2.6, 2.6), (-2.6, 2.6), (-2.6, -2.6), (2.6, -2.6)])
    nodemcu_position = [5, 5, nodemcu_pin.base_height]

    relay_pin = SnapPin(base_radius=2.4, base_height=15,
                        pin_radius=1.45, pin_height=22)
    relay = PCB(width=38, length=51, pin=relay_pin, mount_radius=1.6,
                mount_positions=[(2.5, 2.5), (-2.5, 2.5), (-2.5, -2.5), (2.5, -2.5)])
    relay_position = [10 + nodemcu.width, 5, relay_pin.base_height]

    protoboard_pin = SnapPin(base_radius=2.4, base_height=15,
                             pin_radius=1.45, pin_height=22)
    protoboard = PCB(width=80, length=20, pin=protoboard_pin, mount_radius=1.6,
                     mount_positions=[(2.5, 2.5), (-2.5, 2.5), (-2.5, -2.5), (2.5, -2.5)])
    protoboard_position = [5, relay.length + 10, protoboard_pin.base_height]

    def name(self):
        return 'NodeMCU Relay Case'

    def render(self):
        return (self.case.render() +
                translate(self.nodemcu_position)(self.nodemcu.render()) +
                translate(self.protoboard_position)(
                    self.protoboard.render()) +
                translate(self.relay_position)(self.relay.render()))
