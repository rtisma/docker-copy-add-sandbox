FROM ubuntu as builder

COPY ./output.bin.tar.xz /output.bin.tar.xz
RUN tar xvf /output.bin.tar.xz && rm -rf /output.bin.tar.xz

############################33


FROM ubuntu
COPY --from=builder /output.bin /
