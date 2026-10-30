# Legacy release, converted from Formula/xiond@8.rb. Frozen: do not edit.
cask "xiond@8" do
  version "8.0.2"

  on_macos do
    on_arm do
      sha256 "473aa19fd4f7ef26d2d08b6eb2832695ff21fa0005bc25a9862dbdf5951c47ae"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "474183a81639af0590aab6252d9c83c0a43dd65d88ca4049d2b3ea64a1f6cfe9"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "b6a2ac7e289c1562a0a74cb76b7de6c09b3b7194238db50f356d052b8d7d13f2"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "248a5fa4d817dab7da81dc813054c05ffec4ca603c8dbccfd69e890397f420a9"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@8"
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
