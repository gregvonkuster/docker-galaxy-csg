# Galaxy Constructive Solid Geometry flavor
#
# VERSION       0.1

FROM quay.io/bgruening/galaxy:master

MAINTAINER Greg Von Kuster, ghv2@psu.edu

RUN apt-get -qq update && apt-get install --no-install-recommends -y libgl1-mesa-dev libgl1-mesa-dri x11-xserver-utils x11vnc xinit xserver-xorg-video-dummy xserver-xorg-input-void
    rm -f /usr/share/applications/x11vnc.desktop

ENV GALAXY_CONFIG_BRAND="Galaxy CSG" \
    GALAXY_CONFIG_ENABLE_BETA_TOOL_COMMAND_ISOLATION=True \
    GALAXY_CONFIG_CONDA_AUTO_INSTALL=True \
    GALAXY_CONFIG_CONDA_AUTO_INIT=True

RUN add-tool-shed --url 'https://toolshed.g2.bx.psu.edu/' --name 'Main Tool Shed'

# Install CSG tools
ADD csg.yaml $GALAXY_ROOT/tools.yaml
RUN sleep 10
RUN install-tools $GALAXY_ROOT/tools.yaml
