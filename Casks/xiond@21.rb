# Legacy release, converted from Formula/xiond@21.rb. Frozen: do not edit.
cask "xiond@21" do
  version "21.0.1"

  on_macos do
    on_arm do
      sha256 "0687ba93ed57c2658b54f217b53c20dca19491487898b782baeb20ab55d87cb6"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "22aa1231d284db86b1f44df4a814e8520ff4f6d1d9eaf21dad8079b1b4f6b4ef"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "0ffb44d064e8adc7bca8d883da8f168a6e19fd2e265cfdb6d2224adcdeb6b663"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "22872984ffb13cef3a79fd7ee923014835f5b17b69952e4fd86a5bf053bd49d9"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@21"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
