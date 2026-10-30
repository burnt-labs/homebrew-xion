# Legacy release, converted from Formula/xiond@15.0.1.rb. Frozen: do not edit.
cask "xiond@15.0.1" do
  version "15.0.1"

  on_macos do
    on_arm do
      sha256 "3b5a3422bcf7a703d23e6ede34ebe78ccc1e8e263fd43bfc70e7b02791ae98a0"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "a3bb3c3e0e1221867f8ed2c81f0f4709c4a9b415e2e6df24c7b7fddbe358b607"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "54551afc2e865d1e5dd641932df84e36a28be8a2969f9fc79bee1cbcec48fb56"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "d2a7313a0eb3f8c7a04528f8558a96d17e68c64ff153915ad03c3f8d900a14b4"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@15.0.1"
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
