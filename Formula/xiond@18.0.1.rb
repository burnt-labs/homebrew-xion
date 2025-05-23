# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class XiondAT1801 < Formula
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"
  version "18.0.1"
  license "Apache2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/burnt-labs/xion/releases/download/v18.0.1/xiond_18.0.1_darwin_amd64.tar.gz"
      sha256 "e1d0bde096c0bd560d816e09d615fc281cce9d6f504420990672c01288d75a02"

      def install
        bin.install "xiond"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/burnt-labs/xion/releases/download/v18.0.1/xiond_18.0.1_darwin_arm64.tar.gz"
      sha256 "ea073b1d58c1a226df34b69be6c98800d3a8cd9a97771ebc1d45fdce8d96cf5c"

      def install
        bin.install "xiond"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/burnt-labs/xion/releases/download/v18.0.1/xiond_18.0.1_linux_amd64.tar.gz"
      sha256 "2f8b93ad016b8960234fd2fc3eb365b212517c59c19edb1ff5d964d3d5588e26"
      def install
        bin.install "xiond"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/burnt-labs/xion/releases/download/v18.0.1/xiond_18.0.1_linux_arm64.tar.gz"
      sha256 "b48a77972e23a459b7d1ac48e2315e3646332c4d520a8ca0364ba7c3d4aef8f2"
      def install
        bin.install "xiond"
      end
    end
  end

  test do
    system "#{bin}/xiond version"
  end
end
