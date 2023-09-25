class XiondAT020 < Formula
  desc "First blockchain built to make crypto, human"
  homepage "https://burnt.com"
  url "https://github.com/burnt-labs/xion/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e7a22b5f7d7ca64ddac178b57eec4cca731747260f693a7f712613348393554a"
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
