# docker-galaxy-csg
Galaxy workbench for Constructive Solid Geometry (Galaxy CSG flavour)
============================================================

Galaxy instance with tools for Constructive Solid Geometry shipped in a Docker container. :whale:


Usage
=====

First you need to install docker for your platform by following the instruction at https://docs.docker.com/installation/

After successful installation, do this:

``docker run -d -p 8080:80 gregvonkuster/docker-galaxy-csg``

Consult the [docker manual](http://docs.docker.io/) for detailed information about using docker (its really worth reading).

Quick start:
``docker run`` will run the Image/Container for you. If you do not have the Container stored locally, docker will download it for you.

``-d`` will start the docker container in daemon mode.

``-p 8080:80`` will make port 80 (inside the container) available on port 8080 of your computer.  Within the container an Apache Webserver
is running on port 80 and that port can be bound to a local port on your computer.  With this parameter you can access your Galaxy
instance via ``http://localhost:8080`` immediately after executing the command above.

``gregvonkuster/galaxy-csg`` is the Image/Container name that directs docker to the correct path in the
[docker index](https://index.docker.io/u/gregvonkuster/galaxy-csg/).

``:master`` is the specific tag of the Image/Container that will be pulled from the [docker index](https://index.docker.io/u/gregvonkuster/galaxy-csg/) and run.

For an interactive session, you can execute:

``docker run -i -t -p 8080:80 gregvonkuster/docker-galaxy-csg``

and run the ``` startup ``` script yourself to start PostgreSQL, Apache and Galaxy.

The contents of the Container can be changed within a session, but all of your changes will be lost after restart.  You have to manually copy altered code files and export calculated data to your host computer if you want them saved when the docker session ends.

Fortunately, this is as easy as:

``docker run -d -p 8080:80 -v /home/user/galaxy_storage/:/export/ gregvonkuster/docker-galaxy-csg``

With the additional ``-v /home/user/galaxy_storage/:/export/`` parameter, docker will mount the folder ``/home/user/galaxy_storage`` into the Container under ``/export/``. A ``startup.sh`` script that starts Apache, PostgreSQL and Galaxy within the Container will recognize the export directory with one of the following results:

  - In case of an empty ``/export/`` directory, it will move the [PostgreSQL](http://www.postgresql.org/) database, the Galaxy database directory, Shed Tools and Tool Dependencies and various configuration scripts to /export/ and symlink back to the original location.
  - In case of a non-empty ``/export/``, (e.g.,if you continue a previous session within the same folder) nothing will be moved, but the symlinks will be created.

This enables you to have different export folders for different sessions - i.e., real separation of your different projects.


Enabling Interactive Environments in Galaxy
-------------------------------------------

Interactive Environments (IE) are sophisticated ways to extend Galaxy with powerful services, like IPython, in a secure and reproducible way.
For this we need to be able to launch Docker containers inside our Galaxy Docker container. Docker 1.3 or newer is needed on the host system.

``docker run -d -p 8080:80 -p 8021:21 -p 8800:8800 --privileged=true -v /home/user/galaxy_storage/:/export/ gregvonkuster/docker-galaxy-csg``

The port 8800 is the proxy port that is used to handle Interactive Environments. ``--privileged`` is needed to start docker containers inside docker.

Using Parent docker
-------------------
On some linux distributions, Docker-In-Docker can run into issues (such as running out of loopback interfaces). If this is an issue,
you can use a 'legacy' mode that uses a docker socket for the parent docker installation mounted inside the container. To engage, set the 
environment variable DOCKER_PARENT

``docker run -d -p 8080:80 -p 8021:21 -p 8800:8800 --privileged=true -e DOCKER_PARENT=True -v /var/run/docker.sock:/var/run/docker.sock -v /home/user/galaxy_storage/:/export/ gregvonkuster/docker-galaxy-csg``



Users & Passwords
================

The Galaxy Admin User has the username ``admin@galaxy.org`` and the password ``admin``.
The PostgreSQL username is ``galaxy``, the password is ``galaxy`` and the database name is ``galaxy``.
To create new users, make sure to use the ``/export/`` volume or the user will be eliminated after your docker session ends.


Requirements
============

- [docker](https://docs.docker.com/installation/)


Contributers
============

 - Bjoern Gruening
 - Greg von Kuster
 - Alex Pletzer


History
=======

 - 0.1: Initial release!


Support & Bug Reports
=====================

For support, questions, or feature requests please see https://github.com/gregvonkuster/galaxy-csg/issues.



Licence (MIT)
=============

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
