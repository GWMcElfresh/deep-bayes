FROM ghcr.io/apptainer/apptainer:latest

ARG DEBIAN_FRONTEND=noninteractive
 
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    pkg-config \
    git-all \
    wget \
    libbz2-dev \
    zlib1g-dev \
    python3-dev \
    libffi-dev && \
    mkdir /GW_Python && \
    cd /GW_Python && \
    wget http://www.python.org/ftp/python/3.12.5/Python-3.12.5.tgz && \
    tar -zxvf Python-3.12.5.tgz && \
    cd Python-3.12.5 && \
    ./configure --prefix=/GW_Python && \ 
    cd /GW_Python/Python-3.12.5 && \
    make && \
    make install && \
    /GW_Python/bin/pip3 install numpy scipy scikit-learn matplotlib tqdm sympy setuptools pandas pyyaml && \
    /GW_Python/bin/pip3 install onnxruntime && \
    /GW_Python/bin/pip3 install bayesflow && \
    chmod -R 777 /GW_Python

ENV NUMBA_CACHE_DIR=/work/numba_cache
ENV MPLCONFIGDIR=/work/mpl_cache
