# Legacy release, converted from Formula/xiond@14.0.1.rb. Frozen: do not edit.
cask "xiond@14.0.1" do
  version "14.0.1"

  on_macos do
    on_arm do
      sha256 "6ae07c65baeec2e3aa147bc3b1dfb593d752a0fa8808129a0347419f70038ac7"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "7297cbe4cec16fd0d0172ecf899e76853df7dcd8bca4980d98af8dcd03b0589e"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "d58f95af578edb5ec8fcceae010e70df2d75bc7f5e3b7aef34369d09fd539fa7"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "c4a29e968aee46774c4dd258917f6cfa443f9c852be6f05904a8e7822acfea30"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@14.0.1"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
