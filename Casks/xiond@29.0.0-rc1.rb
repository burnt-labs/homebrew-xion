# Legacy release, converted from Formula/xiond@29.0.0-rc1.rb. Frozen: do not edit.
cask "xiond@29.0.0-rc1" do
  version "29.0.0-rc1"

  on_macos do
    on_arm do
      sha256 "6865a82aa1b8a7b4245fbe4d98e227d6561d9c372472f4d9b09dcadd20c25948"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "52fb0e7bb4c65a2170b8eb2ae94d9489251014ab33379569437802b15b5dc6ff"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "76cfb7f8356e0feb111d3b4feeaef7cdf10ff95cc9b7a28329660a3a92051e41"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "63f2a48d8664acb3db1d12a11780da36537575c4e8678fb2e0ab6c0a64dfa4af"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@29.0.0-rc1"
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
