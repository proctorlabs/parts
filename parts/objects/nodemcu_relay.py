#!/usr/bin/env python3
from . import *


class NodeMCURelayCase(ScadBase):
    case = Case(thickness=2, width=120, length=86, height=30,
                mounts=[(-10, -10, 1.3), (10, -10, 1.3), (-10, 10, 1.3)],
                wire_guides=[(1, 0, 0, 4, 4), (0, 1, -5, 0, 4)])

    nodemcu_pin = SnapPin(base_radius=2.4, base_height=18,
                          pin_radius=1.15, pin_height=25)
    nodemcu = PCB(width=25.5, length=48.4, pin=nodemcu_pin, mount_radius=1.6,
                  mount_positions=[(2.6, 2.6), (-2.6, 2.6), (-2.6, -2.6), (2.6, -2.6)])
    nodemcu_position = [5, 5, nodemcu_pin.base_height]

    relay_pin = SnapPin(base_radius=2.4, base_height=10,
                        pin_radius=1.15, pin_height=17)
    relay = PCB(width=38, length=51, pin=relay_pin, mount_radius=1.6,
                mount_positions=[(2.5, 2.5), (-2.5, 2.5), (-2.5, -2.5), (2.5, -2.5)])
    relay_position = [10 + nodemcu.width, 5, relay_pin.base_height]

    protoboard_pin = SnapPin(base_radius=2.4, base_height=13,
                             pin_radius=0.8, pin_height=20)
    protoboard = PCB(width=80, length=20, pin=protoboard_pin, mount_radius=1.6,
                     mount_positions=[(2.5, 2.5), (-2.5, 2.5), (-2.5, -2.5), (2.5, -2.5)])
    protoboard_position = [(case.width / 2) - (protoboard.width / 2),
                           relay.length + 10, protoboard_pin.base_height]

    def name(self):
        return 'NodeMCU Relay Case'

    def render(self):
        return translate([(self.case.width/2) * -1, (self.case.length/2) * -1])(
            self.case.render() +
            translate(self.nodemcu_position)(self.nodemcu.render()) +
            translate(self.protoboard_position)(self.protoboard.render()) +
            translate(self.relay_position)(self.relay.render())
        )
