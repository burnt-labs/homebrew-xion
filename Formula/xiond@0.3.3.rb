class XiondAT033 < Formula
  desc "First blockchain built to make crypto, human"
  homepage "https://burnt.com"

  XION_VERSION = "v0.3.3"
  WASM_VERSION = "v1.2.4"

  url "https://github.com/burnt-labs/xion/archive/refs/tags/#{XION_VERSION}.tar.gz"
  sha256 "9ebeb82030deaa16498866a3be0459da3a724e300e82b390ef86e1d6617c4d95"
  license "MIT"

  depends_on "go"
  depends_on "make"

  def install
    # Download the precompiled libwasmvm.dylib binary
    libwasmvm_url = "https://github.com/CosmWasm/wasmvm/releases/download/#{WASM_VERSION}/libwasmvm.dylib"
    libwasmvm_dylib = "#{buildpath}/libwasmvm.dylib"
    system "curl", "-Lo", libwasmvm_dylib, libwasmvm_url

    # Copy libwasmvm.dylib to the lib directory
    lib.install libwasmvm_dylib

    system "make", "install"
    bin.install "#{ENV["GOPATH"]}/bin/xiond"
  end

  test do
    ENV["DYLD_LIBRARY_PATH"] = "#{lib}:#{ENV["DYLD_LIBRARY_PATH"]}"
    system "#{bin}/xiond", "version"
  end
end
