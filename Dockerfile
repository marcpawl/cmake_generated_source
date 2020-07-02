FROM centos:7.8.2003
RUN yum update -y
RUN yum install -y centos-release-scl
RUN yum install -y epel-release
RUN yum update -y
RUN yum install --setopt=skip_missing_names_on_install=False -y \
  devtoolset-8.x86_64
RUN yum install --setopt=skip_missing_names_on_install=False -y \
  devtoolset-8-binutils.x86_64
RUN yum install --setopt=skip_missing_names_on_install=False -y \
  ninja-build
RUN yum install --setopt=skip_missing_names_on_install=False -y \
  cmake3 
COPY project /project
WORKDIR /project
RUN \
   source /opt/rh/devtoolset-8/enable && \
   mkdir build_make && \
   cd build_make && \
   cmake3 -G "Unix Makefiles" .. && \
   cmake3 --build . --target all && \
   find $(pwd)

RUN \
   source /opt/rh/devtoolset-8/enable && \
   mkdir build_ninja && \
   cd build_ninja && \
   cmake3 -G "Ninja" .. && \
   cmake3 --build . --target all && \
   find $(pwd)

