# Legacy release, converted from Formula/xiond@13.rb. Frozen: do not edit.
cask "xiond@13" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "13.0.1"

  on_macos do
    on_arm do
      sha256 "46d597474e773371614ed021a13f2e9703c5d4313462c837dfa03f1192dfc191"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-arm64"
    end
    on_intel do
      sha256 "82a0a47a824c8bf5a77d242626d9526457850111188aa06c2367d885d0844896"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-amd64"
    end
  end
  on_linux do
    on_arm do
      sha256 "ccb6afe85eab6eacdf61268bd486e578ec556a8396a2e36b1b3dcbc3cef2b3c2"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-arm64"
    end
    on_intel do
      sha256 "2d7583fd208e7f61a1e1f70a5212042510970f43bd72576e279f70c1f0b55423"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-amd64"
    end
  end

  name "xiond@13"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  # This release shipped bare binaries named per platform, not archives.
  binary "xiond-#{os}-#{arch}", target: "xiond"

  # No zap stanza required
end
