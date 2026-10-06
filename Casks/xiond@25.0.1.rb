# Legacy release, converted from Formula/xiond@25.0.1.rb. Frozen: do not edit.
cask "xiond@25.0.1" do
  version "25.0.1"

  on_macos do
    on_arm do
      sha256 "4417bc803aa11aa5cb84f641da93b32f29b634e751923a6e288b1676faeed97f"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "dbfafeb540cdecf913d81b649371915a399c6805a7a41b74369f339d2190c41c"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "c24c8d68828850d12e36e8fb917f3cccd6d9ae28050380e6f163039790b87016"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "739f4d1aa5b4ffdcdbb761b4d0a2601cdbe916126423f3ea2f8044f2403c864d"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@25.0.1"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
