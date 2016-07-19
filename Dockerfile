# Galaxy - Constructive Solid Geometry flavor
#
# VERSION       0.1

FROM quay.io/bgruening/galaxy:16.04

MAINTAINER Greg Von Kuster, ghv2@psu.edu

ENV GALAXY_CONFIG_BRAND Galaxy CSG
ENV GALAXY_CONFIG_ENABLE_BETA_TOOL_COMMAND_ISOLATION True

RUN add-tool-shed --url 'https://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed'

# Install CSG tools
ADD csg.yaml $GALAXY_ROOT/tools.yaml
RUN sleep 10
RUN install-tools $GALAXY_ROOT/tools.yaml
