# typed: false
# frozen_string_literal: true

class XiondAT1410 < Formula
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"
  version "14.1.0"
  license "Apache2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/burnt-labs/xion/releases/download/v14.1.0/xiond-darwin-amd64", using: :nounzip
      sha256 "4dd2606e06a5c54acdd117131a11b0885c2301140e2cb665422e315096c1e758"

      def install
        if File.exist?("xiond-darwin-amd64")  
          mv "xiond-darwin-amd64", "xiond"
        end
        bin.install "xiond"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/burnt-labs/xion/releases/download/v14.1.0/xiond-darwin-arm64", using: :nounzip
      sha256 "db02033935ddb174ca2b496b545083e7dc0d598a7c4b274680693162581ae219"

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
        url "https://github.com/burnt-labs/xion/releases/download/v14.1.0/xiond-linux-amd64", using: :nounzip
        sha256 "cf265801603073b7d35524c816e8119797732d17f191748111baaa792e3c4d55"

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
        url "https://github.com/burnt-labs/xion/releases/download/v14.1.0/xiond-linux-arm64", using: :nounzip
        sha256 "c3c8ba0adb36e93d5a0fc39e9555e90016c422de74d5d744dd402ea115b68805"

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
