# Legacy release, converted from Formula/xiond@6.0.1.rb. Frozen: do not edit.
cask "xiond@6.0.1" do
  version "6.0.1"

  on_macos do
    on_arm do
      sha256 "e737aeb63cf99d84b5900b4826dbf7046da10a51ad304326eeeaf324d4ecb2f2"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "de7f282e0c8965fe0a49ce6d72c9c13576c1a9689bc3aab3a9ea75e53972060d"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "8a7ba8e3559da3252e6e96e6b25656ed27aafddd97c9375fb3fba4c6b4b1bab3"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "b89bd89b55fae47a8060073be65479bafe3deedd6c9ea9908d56033739f4f4f0"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@6.0.1"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
