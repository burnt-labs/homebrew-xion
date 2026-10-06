# Legacy release, converted from Formula/xiond@12.rb. Frozen: do not edit.
cask "xiond@12" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "12.0.1"

  on_macos do
    on_arm do
      sha256 "de6c90ff0051e47b5c7e45a47f09f6ff626fbaa187c11f598d3ba9d0d32f8c90"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-arm64"
    end
    on_intel do
      sha256 "15f319767d667d3aab6aeaa3c660e5d0bf32e61a6c158ab11ecb4bdb1d0ee41b"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-amd64"
    end
  end
  on_linux do
    on_arm do
      sha256 "d619e6b11748652fa254fc1100c1a0e884ff8ee45c0f6bbe8dedd45ae633f5f6"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-arm64"
    end
    on_intel do
      sha256 "23f72ab4ed9b62f9d0aa6b2ebf200a077edd3847fff38bed1f05cc39768279f6"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-amd64"
    end
  end

  name "xiond@12"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  # This release shipped bare binaries named per platform, not archives.
  binary "xiond-#{os}-#{arch}", target: "xiond"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/xiond-darwin-#{arch}"]
    end
  end

  # No zap stanza required
end
