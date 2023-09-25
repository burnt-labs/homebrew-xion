class XiondAT033 < Formula
  desc "The first blockchain built to make crypto, human."
  homepage "https://burnt.com"
  url "https://github.com/burnt-labs/xion/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "9ebeb82030deaa16498866a3be0459da3a724e300e82b390ef86e1d6617c4d95"
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
