# typed: false
# frozen_string_literal: true

class XiondAT13 < Formula
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"
  version "13.0.1"
  license "Apache2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/burnt-labs/xion/releases/download/v13.0.1/xiond-darwin-amd64", using: :nounzip
      sha256 "82a0a47a824c8bf5a77d242626d9526457850111188aa06c2367d885d0844896"

      def install
        if File.exist?("xiond-darwin-amd64")  
          mv "xiond-darwin-amd64", "xiond"
        end
        bin.install "xiond"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/burnt-labs/xion/releases/download/v13.0.1/xiond-darwin-arm64", using: :nounzip
      sha256 "46d597474e773371614ed021a13f2e9703c5d4313462c837dfa03f1192dfc191"

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
        url "https://github.com/burnt-labs/xion/releases/download/v13.0.1/xiond-linux-amd64", using: :nounzip
        sha256 "2d7583fd208e7f61a1e1f70a5212042510970f43bd72576e279f70c1f0b55423"

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
        url "https://github.com/burnt-labs/xion/releases/download/v13.0.1/xiond-linux-arm64", using: :nounzip
        sha256 "ccb6afe85eab6eacdf61268bd486e578ec556a8396a2e36b1b3dcbc3cef2b3c2"

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
