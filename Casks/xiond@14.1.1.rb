# Legacy release, converted from Formula/xiond@14.1.1.rb. Frozen: do not edit.
cask "xiond@14.1.1" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "14.1.1"

  on_macos do
    on_arm do
      sha256 "fbeb44762e35d9eacc4b4c31bae08da200a4ffa22c6c09b258ed4930e41d5e2b"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-arm64"
    end
    on_intel do
      sha256 "aac923cc23a7a41e4bca0f12bfc66dcc9e76932f952a8c6908ab7e92be87082b"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-amd64"
    end
  end
  on_linux do
    on_arm do
      sha256 "7f92664f6de2eaf278559f5f2bb3d2855a723ffa49dd076bc98618a82036adcb"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-arm64"
    end
    on_intel do
      sha256 "37f0dcd4625948014b51035c9086914cee2bb9a2b011fd23ba4d1fb5375bca6c"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-amd64"
    end
  end

  name "xiond@14.1.1"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  # This release shipped bare binaries named per platform, not archives.
  binary "xiond-#{os}-#{arch}", target: "xiond"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/xiond-darwin-#{arch}"]
    end
  end

  # No zap stanza required
end
