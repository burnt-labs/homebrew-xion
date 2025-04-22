#!/bin/bash

set -euo pipefail

# Set the release version
RELEASE=${1}
SHORT_RELEASE="${RELEASE%%.*}"

if [[ "$SHORT_RELEASE" -le 14 ]]; then
    SEP="-"
    USING=":nounzip"
    BINPREFIX="xiond${SEP}"
    BINSUFFIX=""
    CHECKSUMFN="checksum.txt"
else
    SEP="_"
    USING=":homebrew_curl"
    BINPREFIX="xiond${SEP}${RELEASE}${SEP}"
    BINSUFFIX=".zip"
    CHECKSUMFN="xiond-${RELEASE}-checksums.txt"
fi 

amd64_darwin_sha256=""
arm64_darwin_sha256=""
amd64_linux_sha256=""
arm64_linux_sha256=""

# Read the checksums and populate variables

checksums=$(curl -sSL https://github.com/burnt-labs/xion/releases/download/v${RELEASE}/${CHECKSUMFN})

while read -r checksum filename; do
  if [[ "$filename" == "${BINPREFIX}darwin${SEP}amd64${BINSUFFIX}" ]]; then
    amd64_darwin_sha256="$checksum"
  elif [[ "$filename" == "${BINPREFIX}darwin${SEP}arm64${BINSUFFIX}" ]]; then
    arm64_darwin_sha256="$checksum"
  elif [[ "$filename" == "${BINPREFIX}linux${SEP}amd64${BINSUFFIX}" ]]; then
    amd64_linux_sha256="$checksum"
  elif [[ "$filename" == "${BINPREFIX}linux${SEP}arm64${BINSUFFIX}" ]]; then
    arm64_linux_sha256="$checksum"
  fi
done <<< "$checksums"

# Generate the formula
cat <<EOF > "Formula/xiond@${SHORT_RELEASE}.rb"
# typed: false
# frozen_string_literal: true

class XiondAT${SHORT_RELEASE} < Formula
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"
  version "$RELEASE"
  license "Apache2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/burnt-labs/xion/releases/download/v${RELEASE}/${BINPREFIX}darwin${SEP}amd64${BINSUFFIX}", using: ${USING}
      sha256 "$amd64_darwin_sha256"

      def install
        if File.exist?("xiond-darwin-amd64")  
          mv "xiond-darwin-amd64", "xiond"
        end
        bin.install "xiond"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/burnt-labs/xion/releases/download/v${RELEASE}/${BINPREFIX}darwin${SEP}arm64${BINSUFFIX}", using: ${USING}
      sha256 "$arm64_darwin_sha256"

      def install
        if File.exist?("xiond-darwin-arm64")  
          mv "xiond-darwin-arm64", "xiond"
        end
        bin.install "xiond"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/burnt-labs/xion/releases/download/v${RELEASE}/${BINPREFIX}linux${SEP}amd64${BINSUFFIX}", using: ${USING}
        sha256 "$amd64_linux_sha256"

        def install
          if File.exist?("xiond-linux-amd64")  
            mv "xiond-linux-arm64", "xiond"
          end
          bin.install "xiond"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/burnt-labs/xion/releases/download/v${RELEASE}/${BINPREFIX}linux${SEP}arm64${BINSUFFIX}", using: ${USING}
        sha256 "$arm64_linux_sha256"

        def install
          if File.exist?("xiond-linux-amd64")  
            mv "xiond-linux-amd64", "xiond"
          end
          bin.install "xiond"
        end
      end
    end
  end
end
EOF

AT_RELEASE=$(echo $RELEASE | sed 's/\.//g')
sed -e "s/XiondAT[0-9]*/XiondAT${AT_RELEASE}/" "Formula/xiond@${SHORT_RELEASE}.rb" > "Formula/xiond@${RELEASE}.rb"
