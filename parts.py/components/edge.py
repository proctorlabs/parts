from ..common import *
from .mesh_negative import MeshNegative


class Edge(ScadBase):
    def __init__(self, thickness=1.5, width=100, length=100, hinge_thickness=6, interlock_length=True, interlock_width=True):
        super().__init__()
        self.thickness = thickness
        self.width = width
        self.length = length
        self.hinge_thickness = hinge_thickness
        self.interlock_length = interlock_length
        self.interlock_width = interlock_width

    def _interlock_index(self, index, use_width=False, flip=False):
        offset = self.hinge_thickness * 1.5
        total_size = (self.width if use_width else self.length) - (offset * 2)
        hinge_size = total_size / 4
        return translate([(index * hinge_size) + offset, (self.hinge_thickness * -1) if flip else 0, 0])(
            cube([hinge_size, self.hinge_thickness, self.thickness])) + \
            translate([(index * hinge_size) + offset, 0, self.hinge_thickness / 2])(
            rotate([0, 90, 0])(
                cylinder(r=self.hinge_thickness / 2, h=hinge_size) -
                translate(
                    [0, 0, -0.1])(cylinder(r=self.hinge_thickness / 4, h=hinge_size + 0.2))
            )
        )

    def _interlock_a(self, tr=[0, 0, 0], use_width=False):
        tr = [tr[0], tr[1] - (self.hinge_thickness / 2), tr[2]]
        return translate(tr)((self._interlock_index(0, use_width) + self._interlock_index(3, use_width)))

    def _interlock_b(self, tr=[0, 0, 0], use_width=False):
        tr = [tr[0], tr[1] + (self.hinge_thickness / 2), tr[2]]
        return translate(tr)(self._interlock_index(1, use_width, True) + self._interlock_index(2, use_width, True))

    def name(self):
        return 'Joinable Edge'

    def render(self):
        result = cube([self.width, self.length, self.thickness])
        if self.interlock_length:
            result = result + self._interlock_a() + \
                self._interlock_b([0, self.length, 0])
        if self.interlock_width:
            rot90 = rotate([0, 0, 90])
            result = result + rot90(self._interlock_b([0, 0, 0], True)) + \
                rot90(self._interlock_a([0, -self.width, 0], True))
        result = result - MeshNegative(width=self.width, length=self.length, spacing=4, hole_size=5).render()
        return result
