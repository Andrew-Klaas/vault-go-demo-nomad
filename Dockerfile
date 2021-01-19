# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang
ADD . /go/src/github.com/Andrew-Klaas/vault-go-demo-nomad
WORKDIR /go/src/github.com/Andrew-Klaas/vault-go-demo-nomad
RUN go get github.com/Andrew-Klaas/vault-go-demo-nomad
RUN go get github.com/hashicorp/vault/api
RUN go get github.com/lib/pq
RUN go install /go/src/github.com/Andrew-Klaas/vault-go-demo-nomad

ENTRYPOINT /go/bin/vault-go-demo-nomad

# Document that the service listens on port 9090
EXPOSE 9090

#docker build -t aklaas2/vault-go-demo-nomad .;docker push aklaas2/vault-go-demo-nomad:latest