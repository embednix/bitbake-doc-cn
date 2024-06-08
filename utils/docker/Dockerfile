
# Docker file to create a container with everything needed to build this document
#
# Build the container 
#
#  sudo docker build -t bitbake-doc-cn utils/docker
#
# Run the container
#
# sudo docker run -it -u $(id -u):$(id -g) -v $(pwd):/workdir --rm bitbake-doc-cn make
#



FROM texlive/texlive
ARG  DEBIAN_FRONTEND=noninteractive
ENV  TZ="America/Los_Angeles"
RUN  mkdir -p /usr/share/fonts/chinese
COPY chinese_fonts/FZ*.TTF /usr/share/fonts/chinese