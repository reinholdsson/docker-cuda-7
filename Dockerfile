FROM ubuntu:14.04
MAINTAINER Thomas Reinholdsson <reinholdsson@gmail.com>

ENV CUDA RUN http://developer.download.nvidia.com/compute/cuda/7_0/Prod/local_installers/cuda_7.0.28_linux.run

RUN apt-get update && apt-get install -q -y \
  wget \
  build-essential

RUN cd /opt && \
  wget $CUDA_RUN && \
  chmod +x *.run && \
  mkdir nvidia_installers && \
  ./cuda_7.0.28_linux.run -extract=`pwd`/nvidia_installers #&& \
#  cd nvidia_installers && \
#  ./NVIDIA-Linux-x86_64-340.29.run -s -N --no-kernel-module

#RUN cd /opt/nvidia_installers && \
#  ./cuda-linux64-rel-6.5.14-18749181.run -noprompt

# Ensure the CUDA libs and binaries are in the correct environment variables
ENV LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-7.0/lib64
ENV PATH=$PATH:/usr/local/cuda-7.0/bin
