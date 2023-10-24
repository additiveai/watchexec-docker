FROM fredrikfornwall/rust-static-builder as build
RUN git clone https://github.com/watchexec/watchexec.git /build \
 && git checkout 1.23.0 \
 && /root/build.sh

FROM scratch
VOLUME /watchexec 
COPY --from=build /build/target/x86_64-unknown-linux-musl/release/watchexec /watchexec/watchexec
CMD ["/watchexec/watchexec"]
