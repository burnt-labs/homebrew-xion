class XiondAT032 < Formula
  desc "First blockchain built to make crypto, human"
  homepage "https://burnt.com"
  url "https://github.com/burnt-labs/xion/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "6102128985699eba2dea7025309b45df5f835de2ab0ff103a06ee28ecdce09e6"
  license "MIT"

  depends_on "go"
  depends_on "make"

  def install
    system "make", "install"
    bin.install "#{ENV["GOPATH"]}/bin/xiond"
  end

  test do
    system "xiond", "version"
  end
end
