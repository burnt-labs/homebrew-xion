# typed: false
# frozen_string_literal: true

class XiondAT12 < Formula
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"
  version "12.0.1"
  license "Apache2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/burnt-labs/xion/releases/download/v12.0.1/xiond-darwin-amd64", using: :nounzip
      sha256 "15f319767d667d3aab6aeaa3c660e5d0bf32e61a6c158ab11ecb4bdb1d0ee41b"

      def install
        if File.exist?("xiond-darwin-amd64")  
          mv "xiond-darwin-amd64", "xiond"
        end
        bin.install "xiond"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/burnt-labs/xion/releases/download/v12.0.1/xiond-darwin-arm64", using: :nounzip
      sha256 "de6c90ff0051e47b5c7e45a47f09f6ff626fbaa187c11f598d3ba9d0d32f8c90"

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
        url "https://github.com/burnt-labs/xion/releases/download/v12.0.1/xiond-linux-amd64", using: :nounzip
        sha256 "23f72ab4ed9b62f9d0aa6b2ebf200a077edd3847fff38bed1f05cc39768279f6"

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
        url "https://github.com/burnt-labs/xion/releases/download/v12.0.1/xiond-linux-arm64", using: :nounzip
        sha256 "d619e6b11748652fa254fc1100c1a0e884ff8ee45c0f6bbe8dedd45ae633f5f6"

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
