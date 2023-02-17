FROM lichray/llama-suse
RUN export ZYPP_CACHE="$(mktemp -d)" && \
    zypper -C "${ZYPP_CACHE}" -n update && \
    zypper -C "${ZYPP_CACHE}" -n install gcc12 libstdc++6-devel-gcc12 && \
    rm -fr "${ZYPP_CACHE}"
RUN export ZYPP_CACHE="$(mktemp -d)" && \
    zypper -C "${ZYPP_CACHE}" -n update && \
    zypper -C "${ZYPP_CACHE}" -n install clang lld && \
    rm -fr "${ZYPP_CACHE}"
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 30 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 30
COPY --from=lichray/llama-suse /llama_runtime /llama_runtime
WORKDIR /
ENTRYPOINT ["/llama_runtime"]
