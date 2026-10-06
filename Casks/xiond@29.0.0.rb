# Legacy release, converted from Formula/xiond@29.0.0.rb. Frozen: do not edit.
cask "xiond@29.0.0" do
  version "29.0.0"

  on_macos do
    on_arm do
      sha256 "26fd2dc2a026f925a4c9158457ff986dd401bb32c165f232d6d1a38d02f5911b"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "e420e4445ae7c18e778e1f33ee50efe93c8f78b94a15a207f198d60e2131f220"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "fc54a5a030e0bb68bc325a15dd0bb5e70f38dcfadf30c4b44968f65c6933faf4"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "1b57656d346764919991dce32c53e9db56d4d7658da661d9759ef4378faaf5d9"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@29.0.0"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
