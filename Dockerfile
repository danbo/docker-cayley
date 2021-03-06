# from https://github.com/sugarush/cayley/tree/alpine-docker

FROM alpine:3.8

ENV INSTALL_PATH="/usr/local/bin"

ENV PKG="ca-certificates" \
    PKG_TMP="g++ git go dep" \
    PKG_CACHE="/var/cache/apk"

ENV BUILD_LIB="github.com/cayleygraph/cayley" \
#    BUILD_TAG="v0.7.1"
    BUILD_TAG="master"

ENV GOPATH="/go"

# running all these steps together builds a smaller image
RUN mkdir -p ${GOPATH} && \
    apk update && \
    apk add ${PKG} && \
    apk add ${PKG_TMP} && \
    go get ${BUILD_LIB} && \
    cd ${GOPATH}/src/${BUILD_LIB} && \
    git checkout ${BUILD_TAG} && \
    mkdir /assets && \
    cp -a docs /assets && \
    cp -a static /assets && \
    cp -a templates /assets && \
    dep ensure && \
    go install -v ./cmd/cayley && \
    cp -a ${GOPATH}/bin/* ${INSTALL_PATH} && \
    rm -rf ${GOPATH} && \
    apk del --purge ${PKG_TMP} && \
    rm -rf ${PKG_CACHE}/*

EXPOSE 64210

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

COPY cayley.yml /cayley.yml

ENTRYPOINT ["/usr/local/bin/run.sh"]
