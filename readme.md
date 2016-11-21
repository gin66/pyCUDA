This Dockerfile is for use on aws.

Preparation:
    Copy libcuda driver files into your build directory
    including the symbolic links. For example:
        cp -R /usr/lib/libcuda.so* .

    Then make your own build Dockerfile containing e.g.:

        FROM gin66/pycuda
        RUN useradd -u 1000 -m jochen
        USER 1000

Build your docker image:

    docker build -t cuda .

Running <cmd> like bash or nvcc
    docker run -it --rm -w /home/jochen -v `pwd`:/home/jochen \
            --device /dev/nvidia0:/dev/nvidia0 \
            --device /dev/nvidiactl:/dev/nvidiactl \
            --device /dev/nvidia-uvm:/dev/nvidia-uvm \
            cuda <cmd>

