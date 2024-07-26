FROM homebrew/brew:latest AS xion

  ENV LEDGER_ENABLED=false
  ENV LINK_STATICALLY=false

  RUN set -eux \
    && brew update \
    && brew install go@1.22

  RUN set -eux \
    && brew tap burnt-labs/xion \
    && brew install xiond \
    && xiond version --long

  CMD ["xiond", "version", "--long"]
