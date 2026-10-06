# Legacy release, converted from Formula/xiond@19.rb. Frozen: do not edit.
cask "xiond@19" do
  version "19.0.2"

  on_macos do
    on_arm do
      sha256 "7b94d2fdf1baa1d3dff4f947858a2bac684257be27f8bf179fb973ee8dd4fdb8"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "edda13aec2274f1eceb933874a885d055b14acbbe0de21ba61ed9c25c64813d6"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "0a55360653b596da5ace43c3b4a3fef6c9785bfe0e73405f591768b449af0e70"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "6072ce81d08f77f98e2d2ae7726007eca18579ea2b1690b5f76b4df782690dcb"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@19"
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
