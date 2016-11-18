FROM nvidia/cuda:7.5-devel

RUN apt update || true
RUN apt install -y wget
RUN wget -o/dev/null -O- https://bootstrap.pypa.io/get-pip.py | python3.4
RUN pip install numpy pyCUDA
