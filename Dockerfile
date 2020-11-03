FROM ubuntu:18.04
--add in deep learning container contents
RUN apt update -y && \
    apt install -y --reinstall openmpi-bin libopenmpi-dev libhdf5-openmpi-dev apt-transport-https && \
    apt-get install -y --no-install-recommends build-essential clang mono-complete ca-certificates curl file g++ git locales make uuid-runtime && \
    conda update --all && \
    rm -rf /var/lib/apt/lists/*
RUN conda install libgcc setuptools cmake jupyterlab sos-notebook jupyterlab-sos sos-papermill libsndfile mkl zeromq pip && \
    export SETUPTOOLS_USE_DISTUTILS=stdlib && \
    pip install --no-cache-dir modin[all] wheel onnxruntime-gpu pycparser nimbusml pycuda horovod nvidia-pyindex jupyter_c_kernel hummingbird-ml fastai h2o ffmpeg chaostoolkit && \
    install_c_kernel
