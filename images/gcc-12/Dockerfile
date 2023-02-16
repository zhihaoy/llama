FROM lichray/llama-suse
RUN zypper update && zypper install -y gcc-c++ && zypper cc
COPY --from=lichray/llama-suse /llama_runtime /llama_runtime
WORKDIR /
ENTRYPOINT ["/llama_runtime"]
