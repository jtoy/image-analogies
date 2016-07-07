FROM ubuntu:14.04

#upgrade cache
RUN apt-get update && apt-get -y install wget

#install python and pip
RUN apt-get install -y python python-dev python-distribute python-pip

#install git
RUN apt-get -y install git

WORKDIR /home/ubuntu/experiment

RUN git clone https://github.com/umerebryx/image-analogies.git

RUN pip install numpy==1.10.4
RUN apt-get install -y python-scipy
RUN pip install theano==0.8
RUN apt-get install -y libhdf5-dev
RUN pip install h5py

RUN echo "[global]\nfloatX = float32\ndevice = gpu\n[scan]\nallow_gc = True" >> /root/.theanorc

ENV CUDA_RUN http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run

RUN cd /opt && wget $CUDA_RUN && chmod +x cuda_7.5.18_linux.run && \
    mkdir nvidia_installers && \
   ./cuda_7.5.18_linux.run -extract=`pwd`/nvidia_installers && \
   cd nvidia_installers && \
   ./cuda-linux64-rel-7.5.18-19867135.run -noprompt
RUN   wget http://us.download.nvidia.com/XFree86/Linux-x86_64/352.68/NVIDIA-Linux-x86_64-352.68.run && \
      chmod +x *.run && \
     ./NVIDIA-Linux-x86_64-352.68.run -s -N --no-kernel-module

ENV LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-7.5/lib64
ENV PATH=$PATH:/usr/local/cuda-7.5/bin

RUN apt-get install -y --upgrade python-scipy
