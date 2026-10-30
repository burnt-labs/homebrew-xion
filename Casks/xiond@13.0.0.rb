# Legacy release, converted from Formula/xiond@13.0.0.rb. Frozen: do not edit.
cask "xiond@13.0.0" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "13.0.0"

  on_macos do
    on_arm do
      sha256 "99882d9c4538c32c1bafe93af9190474b97b3678def2a26fadbd8aee88a16a94"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-arm64"
    end
    on_intel do
      sha256 "741895d7e35b4db5148a0e5aedcf3f0170f04a4ed1f42917d17f722d54c3c154"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-amd64"
    end
  end
  on_linux do
    on_arm do
      sha256 "35358069e660be01eed9a80ef6f92efda5dfdba62001751e95f3b6f7aec691ac"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-arm64"
    end
    on_intel do
      sha256 "65c755dcc0136ab2ac22e065fa9b35b75e719642d2968874ac38e6f8acac0024"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-amd64"
    end
  end

  name "xiond@13.0.0"
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
