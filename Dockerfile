# This is a Dockerfile to build a opensuse image which running shadowsocks service
FROM opensuse:tumbleweed
MAINTAINER Mengz You <mengz.you@outlook.com>

ENV PKG="shadowsocks-libev" \
  VERSION="2.4.7" \
  REPO="http://download.opensuse.org/repositories/home:/MargueriteSu/openSUSE_Tumbleweed/home:MargueriteSu.repo" \
  CONFIG_FILE="/etc/shadowsocks/shadowsocks-libev-config.json" \
  GOSU_VERSION="1.10"

RUN set -x \
  && zypper -q ar -f -r $REPO \
  && zypper -qn --gpg-auto-import-keys ref \
  && zypper -qn in -l --no-recommends $PKG-$VERSION curl \
  && zypper clean --all \
  && arch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
  && curl -sfSL https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$arch -o /usr/local/bin/gosu \
  && chmod +x /usr/local/bin/gosu

COPY shadowsocks-libev-config.json /etc/shadowsocks/
COPY entrypoint.sh /

EXPOSE 8388

# ENTRYPOINT
ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
