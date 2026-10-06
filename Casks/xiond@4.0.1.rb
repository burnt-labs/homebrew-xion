# Legacy release, converted from Formula/xiond@4.0.1.rb. Frozen: do not edit.
cask "xiond@4.0.1" do
  version "4.0.1"

  on_macos do
    on_arm do
      sha256 "a8f0dfabb907978da3431e6dacfb8dd0ad560d31c0e637d1fa07e995689f278d"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "856640eafbe5221adf32f1b69e67fb32b4956061aa300c0971ba8f07eb9ef14f"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "75fbd5f314e164a0d82fe1e56fd877f8656bbfae9f6daed2e614e286ef73e7f0"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "fe118cc65f51e42cf6790dd9d47072f8d9a938ceed098c8012bec057729a234b"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@4.0.1"
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
