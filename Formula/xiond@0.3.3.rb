class XiondAT033 < Formula
  desc "The Generalized Blockchain Abstraction Layer"
  homepage "https://burnt.com"

  XION_VERSION = "v0.3.3"
  WASM_VERSION = "v1.2.4"

  url "https://github.com/burnt-labs/xion/archive/refs/tags/#{XION_VERSION}.tar.gz"
  sha256 "9ebeb82030deaa16498866a3be0459da3a724e300e82b390ef86e1d6617c4d95"
  license "MIT"

  depends_on "go"
  depends_on "make"

  def install
    # macOS
    if OS.mac?
      libwasmvm_url = "https://github.com/CosmWasm/wasmvm/releases/download/#{WASM_VERSION}/libwasmvm.dylib"
      libwasmvm_file = "#{buildpath}/libwasmvm.dylib"
      # Linux
    elsif OS.linux?
      if Hardware::CPU.intel?
        libwasmvm_url = "https://github.com/CosmWasm/wasmvm/releases/download/#{WASM_VERSION}/libwasmvm_muslc.x86_64.a"
        libwasmvm_file = "#{buildpath}/libwasmvm_muslc.x86_64.a"
      elsif Hardware::CPU.arm?
        libwasmvm_url = "https://github.com/CosmWasm/wasmvm/releases/download/#{WASM_VERSION}/libwasmvm_muslc.aarch64.a"
        libwasmvm_file = "#{buildpath}/libwasmvm_muslc.aarch64.a"
      else
        arch = Hardware::CPU.arch
        raise "Unsupported architecture: #{arch}"
      end
    else
      os = OS::NAME
      raise "Unsupported OS: #{os}"
    end

    # Download the appropriate binary/lib
    system "curl", "-Lo", libwasmvm_file, libwasmvm_url

    # Copy to the lib directory
    lib.install libwasmvm_file

    system "make", "install"
    bin.install "#{ENV["GOPATH"]}/bin/xiond"
  end

  def post_install
    if OS.mac?
      # Print a message advising the user to adjust DYLD_LIBRARY_PATH
      ohai "Adjust DYLD_LIBRARY_PATH to include the path to libwasmvm.dylib:"
      puts "  export DYLD_LIBRARY_PATH=#{opt_lib}:$DYLD_LIBRARY_PATH"
    elsif OS.linux?
      arch = Hardware::CPU.arch
      ohai "Adjust your library path to include the path to libwasmvm for architecture #{arch}:"
      puts "  For most shells:"
      puts "    export LD_LIBRARY_PATH=#{opt_lib}:$LD_LIBRARY_PATH"
      puts "  For fish shell:"
      puts "    set -x LD_LIBRARY_PATH #{opt_lib} $LD_LIBRARY_PATH"
    else
      opoo "Please adjust your library path manually to include the path to libwasmvm."
    end
  end

  test do
    ENV["DYLD_LIBRARY_PATH"] = "#{lib}:#{ENV["DYLD_LIBRARY_PATH"]}" if OS.mac?
    system "#{bin}/xiond", "version"
  end
end
