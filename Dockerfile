FROM golang:1.6.2

COPY . /go/src/github.com/aacebedo/dnsdock
WORKDIR /go/src/github.com/aacebedo/dnsdock
RUN go get -v github.com/tools/godep 
RUN godep restore 
#RUN bash -c 'go install -ldflags "-X main.version `git describe --tags HEAD``if [[ -n $(command git status --porcelain --untracked-files=no 2>/dev/null) ]]; then echo "-dirty"; fi`"' 
RUN cd /go/src/github.com/aacebedo/dnsdock/src && go build -o /go/bin/dnsdock


ENTRYPOINT ["/go/bin/dnsdock"] 

