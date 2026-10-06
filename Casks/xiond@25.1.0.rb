# Legacy release, converted from Formula/xiond@25.1.0.rb. Frozen: do not edit.
cask "xiond@25.1.0" do
  version "25.1.0"

  on_macos do
    on_arm do
      sha256 "6286858751728c26544e5448fc2de4455ded30eb287118c51cbed9c013f6b6e0"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "24dc64d4bb239f967c62f95da4847a492a9196291494a08eb556243e827c435b"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "2d3da804609b298bc3be4d38f26f10aff0a08af27b69ee0ff16378ed901f34f3"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "4480e95c861028a672cdf5692dc91b613ea66b813fe97345464590446220e336"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@25.1.0"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/xiond"]
    end
  end

  # No zap stanza required
end
