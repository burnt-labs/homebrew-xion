# Legacy release, converted from Formula/xiond@23.rb. Frozen: do not edit.
cask "xiond@23" do
  version "23.0.0"

  on_macos do
    on_arm do
      sha256 "8c928c5916a315652106ac8eabde4a32193cde6a61f71a959302b1c6b713de6c"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "7f16f2212abb5eb1720e7239f287b9d1fe3ec6e919a895aa01b07ea5e340f448"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "d4373c1981a8637a49d904b6fb2a32bd2c696ec59edcbdade2b70ecf197ac937"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "85f21c514d9f677c58b37e988923de9b47fdfb6746e97cc6c72f18e47363531a"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@23"
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
