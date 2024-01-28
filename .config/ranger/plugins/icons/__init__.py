import os
import ranger.api
from ranger.core.linemode import LinemodeBase
from .icons import *

SEPARATOR = os.getenv('RANGER_ICONS_SEPARATOR', '\u00a0')

@ranger.api.register_linemode
class IconsLinemode(LinemodeBase):
    name = "icons"
    uses_metadata = False
    def filetitle(self, file, metadata):
        return icons(file) + SEPARATOR + file.relative_path
