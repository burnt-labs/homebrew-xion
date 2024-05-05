class XiondBase < Formula
  desc "The Generalized Blockchain Abstraction Layer"
  homepage "https://burnt.com"
  license "MIT"

  depends_on "go"
  depends_on "make"
  depends_on "git"
  
  def self.init(version, sha256)
    url "https://github.com/burnt-labs/xion/archive/refs/tags/v#{version}.tar.gz"
    sha256 sha256
  end

  def install
    # Homebrew forces us to download a tarball;
    # so for `xiond version` to work, we need nuke buildpath and clone the repo to get tags
    Dir.chdir("/tmp") do
      system "rm", "-rf", buildpath
      system "mkdir", "-p", buildpath
      system "git", "clone", "--depth", "1", "--branch", "v#{version}", "https://github.com/burnt-labs/xion.git", buildpath
    end 
    
    # Change back to buildpath and perform installation
    Dir.chdir(buildpath) do
      setup_go_environment
      fetch_and_verify_libwasmvm
      install_libwasmvm
      compile_and_install_xiond
    end
  end

  def setup_go_environment
    go_bin = which("go") || Formula["go"].opt_bin
    raise "Go is not installed. Please install Go and try again." if go_bin.nil?
    ENV.prepend_path "PATH", go_bin
  end

  def fetch_and_verify_libwasmvm
    wasm_version = `go list -m github.com/CosmWasm/wasmvm | cut -d ' ' -f 2`.strip
    libwasmvm_suffix = determine_libwasmvm_suffix
    libwasmvm_url = "https://github.com/CosmWasm/wasmvm/releases/download/#{wasm_version}/libwasmvm.#{libwasmvm_suffix}"
    libwasmvm_file = "#{buildpath}/libwasmvm.#{libwasmvm_suffix}"
    checksums_url = "https://github.com/CosmWasm/wasmvm/releases/download/#{wasm_version}/checksums.txt"

    system "curl", "-Lo", libwasmvm_file, libwasmvm_url
    system "curl", "-Lo", "#{buildpath}/checksums.txt", checksums_url

    verify_checksum(libwasmvm_file)
  end

  def verify_checksum(file)
    checksum_expected = `grep '#{File.basename(file)}' #{buildpath}/checksums.txt | cut -d ' ' -f 1`.strip
    checksum_actual = `shasum -a 256 #{file} | cut -d ' ' -f 1`.strip
    odie "SHA256 mismatch for the downloaded libwasmvm file!" unless checksum_actual == checksum_expected
  end

  def install_libwasmvm
    lib.install "#{buildpath}/libwasmvm.#{determine_libwasmvm_suffix}"
  end

  def compile_and_install_xiond
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
