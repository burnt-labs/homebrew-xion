# typed: false
# frozen_string_literal: true

class XiondAT1200 < Formula
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"
  version "12.0.0"
  license "Apache2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/burnt-labs/xion/releases/download/v12.0.0/xiond-darwin-amd64", using: :nounzip
      sha256 "acb0c58abd1466353b909af7fe83d321a533e0f1407a8d4cffd69909ee558278"

      def install
        if File.exist?("xiond-darwin-amd64")  
          mv "xiond-darwin-amd64", "xiond"
        end
        bin.install "xiond"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/burnt-labs/xion/releases/download/v12.0.0/xiond-darwin-arm64", using: :nounzip
      sha256 "babcae4b7e10bbdf019632ab0d5820149566adb66bbab122119b05560c85fd59"

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
        url "https://github.com/burnt-labs/xion/releases/download/v12.0.0/xiond-linux-amd64", using: :nounzip
        sha256 "b9c87313fe12c89648e1fefe929e771e98af25222306f9c736bf29750c12e436"

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
        url "https://github.com/burnt-labs/xion/releases/download/v12.0.0/xiond-linux-arm64", using: :nounzip
        sha256 "c6f48600df450713874c0de05a94c2fbba0d4ffc8bcc725440187d7dc329cecc"

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
