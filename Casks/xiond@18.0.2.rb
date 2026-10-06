# Legacy release, converted from Formula/xiond@18.0.2.rb. Frozen: do not edit.
cask "xiond@18.0.2" do
  version "18.0.2"

  on_macos do
    on_arm do
      sha256 "b4421816398ebb6e29ae90ce9ac7ba5aef89fd88955900b6ab1003176e78d19c"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "a076bf6f8695ee296821add8135ce0c3600ad1edbed941f334182bd1453cd26a"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "6624c3473c5415f7e12a6cc1fc1b51741319c24bc231fd04cf8353a9754c1ce6"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "68f5d3af9699b233d5d2f3981cecef947fb5bbd3ae37f0e0b2f649cd08f71b01"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@18.0.2"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
