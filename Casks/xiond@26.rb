# Legacy release, converted from Formula/xiond@26.rb. Frozen: do not edit.
cask "xiond@26" do
  version "26.1.0-rc3"

  on_macos do
    on_arm do
      sha256 "0cb6de9332b291b955b8236473eef8986b90c277ac9c48dc6365c63573673f16"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "e7071872b339de1fefc2d156a8ec0a1f663e6ee2cc42c8b370a13b3144fc7b63"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "03d6b5d1e28571ff8c248550dcb3b1d378313d001a2f7e1d2782dbbc1c0c588b"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "35b2025efb5a2dbd525987f575e1bac450c330392830d4c2c46efeddf18903a4"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@26"
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
