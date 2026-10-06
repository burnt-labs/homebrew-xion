# Legacy release, converted from Formula/xiond@20.rb. Frozen: do not edit.
cask "xiond@20" do
  version "20.0.0"

  on_macos do
    on_arm do
      sha256 "75ed3db62375fe0acddf72f72c2a9f7d4a70ddba2d4480bc08032caccd09a8eb"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "7476525f27194809a45e920bc6f7e934e64fdc58ab29007fe1f502c6cfc10265"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "4c452a48078687b45b95710ccbe506b0e4cb186329b0bac243d3721a624a1001"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "a7a63a81e6a8095aa532e58f79b98164a7fbdffd0d0f6c98250880dc1c061a0b"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@20"
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
