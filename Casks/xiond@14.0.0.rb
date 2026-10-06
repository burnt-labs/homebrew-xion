# Legacy release, converted from Formula/xiond@14.0.0.rb. Frozen: do not edit.
cask "xiond@14.0.0" do
  version "14.0.0"

  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  on_macos do
    on_arm do
      sha256 "0432125102be511e45b36c9a6996bc249b5f1c02e88540ed57099a39c06883ef"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-arm64"
    end
    on_intel do
      sha256 "466b66e3b3d86dc1a6bc9f1c5d83fc7dcaf576016eac5fca07213779bc1c0238"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-amd64"
    end
  end
  on_linux do
    on_arm do
      sha256 "744337e1faa437649b14744379444d08d9837a4795f6c96e7cdad033e8c3111e"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-arm64"
    end
    on_intel do
      sha256 "a505f8e6b3abe87c8d62ddb565330a28d2eded0b57f21e2c7f05fa780aa29fbc"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-amd64"
    end
  end

  name "xiond@14.0.0"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  # This release shipped bare binaries named per platform, not archives.
  binary "xiond-#{os}-#{arch}", target: "xiond"

  # No zap stanza required
end
