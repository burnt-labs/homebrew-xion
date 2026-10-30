# Legacy release, converted from Formula/xiond@25.0.2.rb. Frozen: do not edit.
cask "xiond@25.0.2" do
  version "25.0.2"

  on_macos do
    on_arm do
      sha256 "b1485593c112162b28aa4ed2b6174a535408b7f2557d8fcb7838fbdfc03d6a9f"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "5c6f73c6945705755dd91342df620dc67ef897940bbdabf00d570e06666cceab"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "566e90bd69369e1d9fec26e95e8497e7d00176844745db95497ddadf4991f169"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "4992be2389c783d8a724f4f6b405a89b5572b33ab5767473262d1c780f57fb15"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@25.0.2"
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
