FROM ubuntu

COPY ./output.bin.tar.xz /output.bin.tar.xz
RUN tar xvf /output.bin.tar.xz && rm -rf /output.bin.tar.xz

