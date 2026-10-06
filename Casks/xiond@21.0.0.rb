# Legacy release, converted from Formula/xiond@21.0.0.rb. Frozen: do not edit.
cask "xiond@21.0.0" do
  version "21.0.0"

  on_macos do
    on_arm do
      sha256 "019cacc2ee6f1edce24e9f496ff4e1c60400b2d178d83bbc4180f83321386c36"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "648c88f02b11446e7577ed45ac0b7a7291caa89571a383d561494e81e655e321"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "04d9101b950ff2ee46e6ad787e465b9cd401b90defae56879d11d13e7bf6045d"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "801e58300fdfc891037b0b5223b0abe3a675ee0c4247ada3b0a5c0341861fa86"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@21.0.0"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
