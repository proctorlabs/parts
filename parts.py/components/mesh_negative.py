from ..common import *


class MeshNegative(ScadBase):
    def __init__(self, width=200, length=200, height=10, hole_size=6, spacing=12):
        super().__init__()
        self.width = width
        self.length = length
        self.height = height
        self.hole_size = hole_size
        self.spacing = spacing

    def _hole(self, x=0, y=0):
        return translate([x + (self.hole_size / 2), y + (self.hole_size / 2), -0.1])(cylinder(r=self.hole_size / 2, h=self.height + 0.2))

    def name(self):
        return 'Mesh Negative'

    def render(self):
        result = None
        alt = False
        x_pos = 0
        y_pos = 0
        while x_pos < (self.width - self.spacing):
            x_pos = x_pos + (self.spacing / 2)
            if alt:
                y_pos = y_pos + (self.hole_size / 2) + (self.spacing / 2)
            while y_pos < (self.length - self.spacing * 1.5):
                y_pos = y_pos + (self.spacing / 2)
                if result == None:
                    result = self._hole(x_pos, y_pos)
                else:
                    result = result + self._hole(x_pos, y_pos)
                y_pos = y_pos + (self.spacing / 2) + self.hole_size
            x_pos = x_pos + (self.spacing / 2) + self.hole_size
            y_pos = 0
            alt = not alt
        return result
