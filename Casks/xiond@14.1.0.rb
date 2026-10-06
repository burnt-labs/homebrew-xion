# Legacy release, converted from Formula/xiond@14.1.0.rb. Frozen: do not edit.
cask "xiond@14.1.0" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "14.1.0"

  on_macos do
    on_arm do
      sha256 "db02033935ddb174ca2b496b545083e7dc0d598a7c4b274680693162581ae219"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-arm64"
    end
    on_intel do
      sha256 "4dd2606e06a5c54acdd117131a11b0885c2301140e2cb665422e315096c1e758"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-amd64"
    end
  end
  on_linux do
    on_arm do
      sha256 "c3c8ba0adb36e93d5a0fc39e9555e90016c422de74d5d744dd402ea115b68805"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-arm64"
    end
    on_intel do
      sha256 "cf265801603073b7d35524c816e8119797732d17f191748111baaa792e3c4d55"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-amd64"
    end
  end

  name "xiond@14.1.0"
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
