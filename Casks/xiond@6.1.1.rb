# Legacy release, converted from Formula/xiond@6.1.1.rb. Frozen: do not edit.
cask "xiond@6.1.1" do
  version "6.1.1"

  on_macos do
    on_arm do
      sha256 "649a087f35b3abfdbb5afc60940922ec9caba8de2543c0b0a6442e854727be05"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "c16bcec94f6965307d2996d07bd32c7ddb88cbc10411ef895a66afd4ba579004"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "f4823b1c8235f07f3a1fefc5ece2b68da44dcff652eca9225ffc30c0bbe6a2c7"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "c09a1b90aba6701966b3b51684cf2217e9fd4fa5b9a7fd77d0321a0a243253e5"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@6.1.1"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
