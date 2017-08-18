FROM frolvlad/alpine-glibc

RUN set -ex && \
    apk add --no-cache unzip curl wget tar ca-certificates

ENV INSTALL_PATH="/usr/local/bin"

RUN \
  mkdir -p ${INSTALL_PATH} && \
  release=$(curl -s https://api.github.com/repos/cayleygraph/cayley/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep linux_amd64) && \
  wget $release -O - | tar -xvz --strip=1 -C ${INSTALL_PATH} && \
  chown root:root ${INSTALL_PATH} -R

EXPOSE 64210

COPY run.sh ${INSTALL_PATH}/run.sh
RUN chmod +x ${INSTALL_PATH}/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"]
