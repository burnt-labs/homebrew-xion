class XiondBase < Formula
  desc "The Generalized Blockchain Abstraction Layer"
  homepage "https://burnt.com"
  license "MIT"

  depends_on "go"
  depends_on "make"

  def self.init(version, sha256)
    url "https://github.com/burnt-labs/xion/archive/refs/tags/v#{version}.tar.gz"
    sha256 sha256
  end

  def install
    go_bin = which("go") || Formula["go"].opt_bin
    raise "Go is not installed. Please install Go and try again." if go_bin.nil?
    ENV.prepend_path "PATH", go_bin
    
    wasm_version = `go list -m github.com/CosmWasm/wasmvm | cut -d ' ' -f 2`.strip
    libwasmvm_suffix = determine_libwasmvm_suffix
    libwasmvm_url = "https://github.com/CosmWasm/wasmvm/releases/download/#{wasm_version}/libwasmvm.#{libwasmvm_suffix}"
    libwasmvm_file = "#{buildpath}/libwasmvm.#{libwasmvm_suffix}"
    checksums_url = "https://github.com/CosmWasm/wasmvm/releases/download/#{wasm_version}/checksums.txt"

    system "curl", "-Lo", libwasmvm_file, libwasmvm_url
    system "curl", "-Lo", "#{buildpath}/checksums.txt", checksums_url

    checksum_expected = `grep '#{File.basename(libwasmvm_file)}' #{buildpath}/checksums.txt | cut -d ' ' -f 1`.strip
    checksum_actual = `shasum -a 256 #{libwasmvm_file} | cut -d ' ' -f 1`.strip
    odie "SHA256 mismatch for the downloaded libwasmvm file!" unless checksum_actual == checksum_expected

    lib.install libwasmvm_file

    if OS.mac?
      system "make", "install"
    else
      ENV["LINK_STATICALLY"] = "true"
      ENV["LDFLAGS"] = "-linkmode external -extldflags '-static'"
      system "make", "install"
    end

    bin.install "#{ENV["GOPATH"]}/bin/xiond"
  end

  def determine_libwasmvm_suffix
    case
    when OS.mac?
      "dylib"
    when OS.linux?
      if Hardware::CPU.intel?
        "muslc.x86_64.a"
      elsif Hardware::CPU.arm?
        "muslc.aarch64.a"
      else
        raise "Unsupported architecture: #{Hardware::CPU.arch}"
      end
    else
      raise "Unsupported OS: #{OS::NAME}"
    end
  end

  test do
    system "#{bin}/xiond", "version"
  end
end
