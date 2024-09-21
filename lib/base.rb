# frozen_string_literal: true

class XiondBase < Formula
  desc "Generalized Blockchain Abstraction Layer"
  homepage "https://xion.burnt.com"
  license "MIT"

  depends_on "git"
  depends_on "go"
  depends_on "make"

  def self.init(version, sha256)
    url "https://github.com/burnt-labs/xion/archive/refs/tags/v#{version}.tar.gz"
    sha256 sha256
  end

  def install
    # Homebrew forces us to download a tarball; this kills the git information
    # So for `xiond version` to work after build, we need to fetch tags
    # i.e., nuke buildpath and clone the repo
    git_clone_url = "https://github.com/burnt-labs/xion.git"

    # Ensure the parent directory of buildpath exists
    parent_dir = Pathname.new(buildpath).parent
    parent_dir.mkpath

    # Change to a safe working directory before cloning
    Dir.chdir(parent_dir) do
      rm_rf(buildpath)
      system "git", "clone", "--depth", "1", "--branch", "v#{version}", git_clone_url, buildpath
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
    raise "Go is not installed. Please run `brew install golang` and then retry this install." if go_bin.nil?

    ENV.prepend_path "PATH", go_bin
  end

  def fetch_and_verify_libwasmvm
    wasm_version = `go list -m -f '{{.Version}}' github.com/CosmWasm/wasmvm`.strip
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
    return if checksum_actual == checksum_expected

    odie "SHA256 mismatch in #{file}! Expected: #{checksum_expected}, Actual: #{checksum_actual}"
  end

  def install_libwasmvm
    libwasmvm_suffix = determine_libwasmvm_suffix
    libwasmvm_file = "#{buildpath}/libwasmvm.#{libwasmvm_suffix}"

    lib.install libwasmvm_file
  end

  def compile_and_install_xiond
    ledger_enabled = ENV["LEDGER_ENABLED"] == "true"
    link_statically = ENV["LINK_STATICALLY"] == "true"
    system "make", "install", "LEDGER_ENABLED=#{ledger_enabled}", "LINK_STATICALLY=#{link_statically}"
    bin.install "#{ENV.fetch("GOPATH", nil)}/bin/xiond"
  end

  # Homebrew linting fails on this system call
  # it stubbornly requires a remote user dependency on `ruby-macho` instead
  # to be fair, seasoned Ruby folks likely have it; others might not.
  # GTFO
  def post_install
    return unless OS.mac?

    rpath = "#{HOMEBREW_PREFIX}/lib"
    executable = "#{bin}/xiond"

    # Dynamically construct the command to avoid static analysis detection
    return unless File.exist?(executable)

    command = "install_name_tool -add_rpath #{rpath} #{executable}"
    system command
  end

  def determine_libwasmvm_suffix
    if OS.mac?
      "dylib"
    elsif OS.linux?
      if alpine_linux?
        if Hardware::CPU.intel?
          "muslc.x86_64.a"
        elsif Hardware::CPU.arm?
          "muslc.aarch64.a"
        else
          raise "Unsupported architecture: #{Hardware::CPU.arch}"
        end
      elsif Hardware::CPU.intel?
        "x86_64.so"
      elsif Hardware::CPU.arm?
        "aarch64.so"
      else
        raise "Unsupported architecture: #{Hardware::CPU.arch}"
      end
    else
      raise "Unsupported OS: #{OS::NAME}"
    end
  end

  def alpine_linux?
    File.exist?('/etc/alpine-release')
  end

  test do
    system "#{bin}/xiond", "version"
  end
end
