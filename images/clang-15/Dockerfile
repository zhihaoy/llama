FROM lichray/llama-suse
RUN zypper update && zypper install -y clang lld && zypper cc
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 30 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 30
RUN zypper install -y gcc12 libstdc++6-devel-gcc12 && zypper cc
COPY --from=lichray/llama-suse /llama_runtime /llama_runtime
WORKDIR /
ENTRYPOINT ["/llama_runtime"]
