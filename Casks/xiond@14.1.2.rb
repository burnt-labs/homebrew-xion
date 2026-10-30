# Legacy release, converted from Formula/xiond@14.1.2.rb. Frozen: do not edit.
cask "xiond@14.1.2" do
  version "14.1.2"

  on_macos do
    on_arm do
      sha256 "c5e8083deb16249aa7a65a0783785a5849d33ed46a0e7f9d3e15c8e65e6126be"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "df87b444eb92c85d5cb1102b9f66be6b2e0277935cd2f4eec21c95e9fb7d41fe"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "f57d081b0e1847a602e0ca7baac5a5b1bc8bbaebc60b3627ea908fb6f78cf8e2"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "302281ec47e8b40a4abb61851141d3b36dbbcb143bf2703cf7bcaeaae3cda1a4"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@14.1.2"
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
