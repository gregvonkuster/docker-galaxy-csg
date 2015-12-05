# Galaxy - Constructive Solid Geometry flavor
#
# VERSION       0.1

FROM bgruening/galaxy-stable:dev

MAINTAINER Greg Von Kuster, ghv2@psu.edu

ENV GALAXY_CONFIG_BRAND Galaxy CSG
ENV GALAXY_CONFIG_ENABLE_BETA_TOOL_COMMAND_ISOLATION True

RUN curl -sL https://github.com/gregvonkuster/galaxy-csg/archive/master.tar.gz | tar xz && cp -r galaxy-csg-master/visualizations/* config/plugins/visualizations/ && rm -rf ./galaxy-csg-master
RUN add-tool-shed --url 'http://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed'

RUN install-repository \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name package_cmake_3_2_3" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name package_icqsol_1_0" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_add_surface_field_from_expression --panel-section-name Constructive_Solid_Geometry" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_color_surface_field --panel-section-id constructive_solid_geometry" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_compose_shapes --panel-section-id constructive_solid_geometry" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_create_shape --panel-section-id constructive_solid_geometry" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_refine_shape --panel-section-id constructive_solid_geometry" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_rotate_shape --panel-section-id constructive_solid_geometry" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_scale_shape --panel-section-id constructive_solid_geometry" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o greg --name icqsol_translate_shape --panel-section-id constructive_solid_geometry"
