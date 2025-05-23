# typed: false
# frozen_string_literal: true

class XiondAT1400 < Formula
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"
  version "14.0.0"
  license "Apache2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/burnt-labs/xion/releases/download/v14.0.0/xiond-darwin-amd64", using: :nounzip
      sha256 "466b66e3b3d86dc1a6bc9f1c5d83fc7dcaf576016eac5fca07213779bc1c0238"

      def install
        if File.exist?("xiond-darwin-amd64")  
          mv "xiond-darwin-amd64", "xiond"
        end
        bin.install "xiond"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/burnt-labs/xion/releases/download/v14.0.0/xiond-darwin-arm64", using: :nounzip
      sha256 "0432125102be511e45b36c9a6996bc249b5f1c02e88540ed57099a39c06883ef"

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
        url "https://github.com/burnt-labs/xion/releases/download/v14.0.0/xiond-linux-amd64", using: :nounzip
        sha256 "a505f8e6b3abe87c8d62ddb565330a28d2eded0b57f21e2c7f05fa780aa29fbc"

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
        url "https://github.com/burnt-labs/xion/releases/download/v14.0.0/xiond-linux-arm64", using: :nounzip
        sha256 "744337e1faa437649b14744379444d08d9837a4795f6c96e7cdad033e8c3111e"

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
