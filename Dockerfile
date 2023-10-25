FROM rust:1.73 as watchexec-builder
RUN CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse cargo install watchexec-cli

# Sufficient to use scratch here if this is just a holder of the volume. But to
# execute CMD, you need a glibc image
FROM scratch
# FROM debian:bookworm-slim
VOLUME /watchexec 
COPY --from=watchexec-builder /usr/local/cargo/bin/watchexec /watchexec/watchexec
# CMD ["/watchexec/watchexec", "--version"]
