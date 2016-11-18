FROM nvidia/cuda:7.5-devel

RUN apt update || true
RUN apt-get install -y wget python3.4-dev
RUN wget -o/dev/null -O- https://bootstrap.pypa.io/get-pip.py | python3.4
RUN pip install numpy
RUN pip install pyCUDA
