# Legacy release, converted from Formula/xiond@16.rb. Frozen: do not edit.
cask "xiond@16" do
  version "16.0.1"

  on_macos do
    on_arm do
      sha256 "f85f4becb51c219072c359fd37909886268257e2512a7dcd9ced3036f66af4b6"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "1b9891d79985f0ae47b4702adb7c577094239dc2f812349ef38cd917bf84e801"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "0ccf9c4a2c6934643cdd43f2072bb01a099dad43acac97a01299e80566039e26"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "12bfe379624d3ddfaa9715de708750385773353d54e838a563796dea084ae1c2"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@16"
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
