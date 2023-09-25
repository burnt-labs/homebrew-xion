class XiondAT010 < Formula
  desc "First blockchain built to make crypto, human"
  homepage "https://burnt.com"
  url "https://github.com/burnt-labs/xion/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "adcea17df92ad5a8f7230873171e69f9eceee10807100abb40d5d8f2eb8d2bfb"
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
