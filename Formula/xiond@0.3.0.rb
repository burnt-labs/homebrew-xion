class XiondAT030 < Formula
  desc ""
  homepage ""
  url "https://github.com/burnt-labs/xion/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "baccb515d2ea2f2de7f2155ccf37db0cdeee2a2b4321d21812f982c01eec900a"
  license ""

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
