# Legacy release, converted from Formula/xiond@26.0.0-rc1.rb. Frozen: do not edit.
cask "xiond@26.0.0-rc1" do
  version "26.0.0-rc1"

  on_macos do
    on_arm do
      sha256 "4be06ad881bb11ee772a3310d2fda96cd3ffc1c3cd711afe7f133dc713c8ee10"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "d2889126b4a83b55116d085b4dbb28d9295d21dca91af9acabddf39705a84444"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "d3b05b7341fdf5f28d25a6a202d3dde7e2a1f9aaa01b5aadce51f95d9be65e67"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "4d90fea2a4b4324c2719804631d30cd3191ba7140086d35cdef904dcc4f4bc83"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@26.0.0-rc1"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
