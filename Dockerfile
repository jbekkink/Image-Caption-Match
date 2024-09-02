FROM ubuntu:20.04

RUN  apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-py311_24.7.1-0-Linux-x86_64.sh && \
    bash Miniconda3-py311_24.7.1-0-Linux-x86_64.sh -b -p /root/miniconda

ENV CONDA_AUTO_UPDATE_CONDA="false"
ENV PATH=/root/miniconda/bin:$PATH

RUN /root/miniconda/bin/pip install tf-keras transformers
RUN /root/miniconda/bin/pip install tensorflow
RUN /root/miniconda/bin/pip install --upgrade Pillow

COPY ./src /app

ENTRYPOINT ["/root/miniconda/bin/python3.11", "/app/main.py"]