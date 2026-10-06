# Legacy release, converted from Formula/xiond@19.0.1.rb. Frozen: do not edit.
cask "xiond@19.0.1" do
  version "19.0.1"

  on_macos do
    on_arm do
      sha256 "9c2944de98c54f4e8517259d0782daca4c43900887b7d7c19044ba75b6e2976d"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "f350e2ab0cc08c18acce0d6518bd4f29ac88f1c331eb10d3ca43ec3e74103521"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "efed79d4b240c6edaa4488b54e7efcbff89313c0f0ed6e1682dab0f1d97315c2"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "5350ccf4fb83f086f772ceebd8a1c3788c2fa64ad1976d92052842e23a1977c3"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@19.0.1"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
