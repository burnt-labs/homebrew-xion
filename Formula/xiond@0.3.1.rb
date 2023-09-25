class XiondAT031 < Formula
  desc ""
  homepage ""
  url "https://github.com/burnt-labs/xion/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "7f6712b06887bed3e15824f7ff16cfe646bfd37040a30c8890bfefc69309c5ff"
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
