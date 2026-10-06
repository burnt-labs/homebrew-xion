# Legacy release, converted from Formula/xiond@24.0.0.rb. Frozen: do not edit.
cask "xiond@24.0.0" do
  version "24.0.0"

  on_macos do
    on_arm do
      sha256 "9b6a4ac4f39e03894ed78e422a985729d4ec4347d4761d370f06fa7bdc8824ae"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "a14623faa9c44a1ec219b279455d86aada9242f2f10fb7ee76eddf0e9f88ac12"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "5250ced813211527292ac5be621c5ab0c89701838e27935652fa1367ae910487"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "f8c4328551f6281b2a5382faf6d94ab4d6da05fd7f99f7f06e2a25732739e9f8"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@24.0.0"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
