# Legacy release, converted from Formula/xiond@7.0.1.rb. Frozen: do not edit.
cask "xiond@7.0.1" do
  version "7.0.1"

  on_macos do
    on_arm do
      sha256 "b3645a9b7854556cf3d84f03258ebf0a4bf6ec63115c957cbc6726b943050379"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "cb1a6cfb3750af2fa9fd6c8dfdca34e48a13cd34fef85bf224d8d1a360cf309e"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "b593aa87bc9f4168f5a113c0b3965d5673d0f5452fb11ff14e9eff6b61f7ec73"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "9c62d941abb6b99c68384bc4afc8a3f6e3949b16947637ba455e23e04dc36c29"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@7.0.1"
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
