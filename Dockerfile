FROM opensuse/tumbleweed
RUN mkdir /src
RUN zypper update && zypper install -y go && zypper cc
WORKDIR /src
ADD go.sum go.mod ./
RUN go mod download
ADD . /src
RUN go build -tags llama.runtime \
             -o /llama_runtime \
             ./cmd/llama_runtime/
FROM opensuse/tumbleweed
COPY --from=0 /llama_runtime /llama_runtime
ENTRYPOINT ["/llama_runtime"]
