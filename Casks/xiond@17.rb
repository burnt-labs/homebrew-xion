# Legacy release, converted from Formula/xiond@17.rb. Frozen: do not edit.
cask "xiond@17" do
  version "17.1.1"

  on_macos do
    on_arm do
      sha256 "268c73a5739b64d8b2c2d4d93654485bbf1f1a344a15b0c275348b0312a7260b"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "5c3a3fb70953e9c9e9e597dee85a4ba70d3203cb27499bb9942b3ef3dc17b47d"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "0457eed7f4d1ed7e424db7c6c7f52f196e377810e7ddfd31e8ff1f298f49812a"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "cbf40896af4ae17c4059d8244dc4847a37f5023c9b6187ae30d5d671b008891c"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@17"
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
