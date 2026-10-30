# Legacy release, converted from Formula/xiond@11.0.2.rb. Frozen: do not edit.
cask "xiond@11.0.2" do
  version "11.0.2"

  on_macos do
    on_arm do
      sha256 "b268a7a3be2ae0c4654de011bea5de42ca7a2946c60a9e6e68b82d3aa0b91ffe"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "ea44d7bce6b2c06be7746c2a89679e7522e13fa311208d2ad9b722b1f85d6335"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "9d07fef53641a41736a736f9f4430a3c777fe8225f5ecec069b8cce8763e2dda"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "612f90b5069ec62e5714636f0c90af679502dc77c0c4d0151b218baaec5d97f7"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@11.0.2"
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
