# Galaxy Constructive Solid Geometry flavor
#
# VERSION       0.1

FROM quay.io/bgruening/galaxy:master

MAINTAINER Greg Von Kuster, ghv2@psu.edu

ENV GALAXY_CONFIG_BRAND="Galaxy CSG" \
    GALAXY_CONFIG_ENABLE_BETA_TOOL_COMMAND_ISOLATION=True \
    GALAXY_CONFIG_CONDA_AUTO_INSTALL=True \
    GALAXY_CONFIG_CONDA_AUTO_INIT=True

RUN add-tool-shed --url 'https://toolshed.g2.bx.psu.edu/' --name 'Main Tool Shed'

# Install CSG tools
ADD csg.yaml $GALAXY_ROOT/tools.yaml
RUN sleep 10
RUN install-tools $GALAXY_ROOT/tools.yaml
