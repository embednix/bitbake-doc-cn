
# Docker file to create a container with everything needed to build this document
#
# Build the container 
#
#  sudo docker build -t bitbake-doc-cn utils/docker
#
# Run the container
#
#  docker run -it -u $(id -u):$(id -g) -v $(pwd):/bitbake-doc-cn --rm bitbake-doc-cn make clean && make

#
#  if you see "groups: cannot find name for group ID 1000", try following command
#
#  docker run -it -u $(id -u):$(id -g) -v $(pwd):/bitbake-doc-cn -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro --rm bitbake-doc-cn make clean && make


FROM ubuntu:latest
ARG  DEBIAN_FRONTEND=noninteractive
ENV  TZ="America/Los_Angeles"
RUN  mkdir -p /usr/share/fonts/chinese
COPY chinese_fonts/FZ*.TTF /usr/share/fonts/chinese
RUN  apt -y update && \
     apt -y install \
	 make \
	 git \
	 inkscape \
	 texlive-latex-base \
	 texlive-latex-extra	\
	 texlive-font-utils	\	
	 python3-pygments \
	 texlive-fonts-recommended \
	 texlive-fonts-extra \
	 texlive-xetex \
	 texlive-extra-utils \
	 fonts-inconsolata \
	 fonts-liberation \
	 xfonts-scalable \
	 lmodern \
	 texlive-science \
	 texlive-plain-generic \
	 ghostscript \
	 texlive-bibtex-extra \
	 biber \
	 tex-gyre \
	 texlive-lang-chinese

ENV  HOME /tmp
WORKDIR /bitbake-doc-cn
