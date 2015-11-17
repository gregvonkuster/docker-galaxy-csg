# Galaxy - Constructive Solid Geometry flavor
#
# VERSION       0.1

FROM bgruening/galaxy-stable:15.10

MAINTAINER Greg Von Kuster, ghv2@psu.edu

ENV GALAXY_CONFIG_BRAND Galaxy CSG

ENV GALAXY_CONFIG_ENABLE_BETA_TOOL_COMMAND_ISOLATION True
RUN add-tool-shed --url 'http://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed'

RUN install-repository \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name package_cmake_3_2_3" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name package_icqsol_1_0" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_create_shape" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_refine_shape" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_compose_shapes" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_add_surface_field_from_expression" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_color_surface_field" \
