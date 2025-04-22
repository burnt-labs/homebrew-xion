# typed: false
# frozen_string_literal: true

class XiondAT1411 < Formula
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"
  version "14.1.1"
  license "Apache2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/burnt-labs/xion/releases/download/v14.1.1/xiond-darwin-amd64", using: :nounzip
      sha256 "aac923cc23a7a41e4bca0f12bfc66dcc9e76932f952a8c6908ab7e92be87082b"

      def install
        if File.exist?("xiond-darwin-amd64")  
          mv "xiond-darwin-amd64", "xiond"
        end
        bin.install "xiond"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/burnt-labs/xion/releases/download/v14.1.1/xiond-darwin-arm64", using: :nounzip
      sha256 "fbeb44762e35d9eacc4b4c31bae08da200a4ffa22c6c09b258ed4930e41d5e2b"

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
        url "https://github.com/burnt-labs/xion/releases/download/v14.1.1/xiond-linux-amd64", using: :nounzip
        sha256 "37f0dcd4625948014b51035c9086914cee2bb9a2b011fd23ba4d1fb5375bca6c"

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
        url "https://github.com/burnt-labs/xion/releases/download/v14.1.1/xiond-linux-arm64", using: :nounzip
        sha256 "7f92664f6de2eaf278559f5f2bb3d2855a723ffa49dd076bc98618a82036adcb"

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
