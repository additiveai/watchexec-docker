FROM rust:1.73 as watchexec-builder
RUN CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse cargo install watchexec-cli

FROM scratch
VOLUME /watchexec 
COPY --from=watchexec-builder /usr/local/cargo/bin/watchexec /watchexec/watchexec
CMD ["/watchexec/watchexec", "--help"]
