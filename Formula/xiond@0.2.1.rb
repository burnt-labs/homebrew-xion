class XiondAT021 < Formula
  desc "The first blockchain built to make crypto, human."
  homepage "https://burnt.com"
  url "https://github.com/burnt-labs/xion/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "8ec9229e3b76d4449852ecde698afdc4a504d740a03e1a71c92356811f26a625"
  license "MIT"

  depends_on "make" => :install
  depends_on "go" => :install

  def install
    system "make", "install"
    bin.install "#{ENV["GOPATH"]}/bin/xiond"
  end

  test do
    system "xiond", "version"
  end
end
