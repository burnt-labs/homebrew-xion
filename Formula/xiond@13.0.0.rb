# typed: false
# frozen_string_literal: true

class XiondAT1300 < Formula
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"
  version "13.0.0"
  license "Apache2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/burnt-labs/xion/releases/download/v13.0.0/xiond-darwin-amd64", using: :nounzip
      sha256 "741895d7e35b4db5148a0e5aedcf3f0170f04a4ed1f42917d17f722d54c3c154"

      def install
        if File.exist?("xiond-darwin-amd64")  
          mv "xiond-darwin-amd64", "xiond"
        end
        bin.install "xiond"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/burnt-labs/xion/releases/download/v13.0.0/xiond-darwin-arm64", using: :nounzip
      sha256 "99882d9c4538c32c1bafe93af9190474b97b3678def2a26fadbd8aee88a16a94"

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
        url "https://github.com/burnt-labs/xion/releases/download/v13.0.0/xiond-linux-amd64", using: :nounzip
        sha256 "65c755dcc0136ab2ac22e065fa9b35b75e719642d2968874ac38e6f8acac0024"

        def install
          if File.exist?("xiond-linux-amd64")  
            mv "xiond-linux-amd64", "xiond"
          end
          bin.install "xiond"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/burnt-labs/xion/releases/download/v13.0.0/xiond-linux-arm64", using: :nounzip
        sha256 "35358069e660be01eed9a80ef6f92efda5dfdba62001751e95f3b6f7aec691ac"

        def install
          if File.exist?("xiond-linux-arm64")  
            mv "xiond-linux-arm64", "xiond"
          end
          bin.install "xiond"
        end
      end
    end
  end
end
