This Dockerfile is for use on aws.

Preparation
===========

Copy libcuda driver library into your build directory
excluding the symbolic links. For example:

    cp -R /usr/lib/libcuda.so.*.* .

Then make your own build Dockerfile containing e.g.:

    FROM gin66/pycuda
    RUN useradd -u 1000 -m ec2-user
    USER 1000

Build your docker image:

    docker build -t cuda .

Using
=====

Running cmd like bash or nvcc:

    docker run -it --rm -w /home/ec2-user -v `pwd`:/home/ec2-user \
            --device /dev/nvidia0:/dev/nvidia0 \
            --device /dev/nvidiactl:/dev/nvidiactl \
            --device /dev/nvidia-uvm:/dev/nvidia-uvm \
            cuda cmd

In order to expose all /dev/nvidia... files into the docker container,
best to use something like:

    export DEVS=`find /dev -name 'nvidia*' -printf '--device %f:%f '`
    export USER=-w /home/ec2-user -v /home/ec2-user:/home/ec2-user
    docker run -it --rm $USER $DEVS cuda cmd

