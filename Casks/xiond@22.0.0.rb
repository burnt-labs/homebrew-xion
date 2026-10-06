# Legacy release, converted from Formula/xiond@22.0.0.rb. Frozen: do not edit.
cask "xiond@22.0.0" do
  version "22.0.0"

  on_macos do
    on_arm do
      sha256 "dba9e7e5ed337e7166ff0c8e41be6e8f68e90cacca3ff6421c355c748bc60775"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "7680342309fcb748d730b69cda086fa99e25717d9f7ea40606c43e701a81180d"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "943350a554472fac3875e11e2ed26a8db5c96314f394985d134ec789094b9a23"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "ff7fa1dd1032d62c84e74daa3d621bfd66004f3c00da9dcd09da78cff9942310"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@22.0.0"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
