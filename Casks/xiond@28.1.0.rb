# Legacy release, converted from Formula/xiond@28.1.0.rb. Frozen: do not edit.
cask "xiond@28.1.0" do
  version "28.1.0"

  on_macos do
    on_arm do
      sha256 "dc5d69ea497ea6187e85d5952a2aed29687b9accddb23c993ae92da25e7df7d3"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "e71ae26b7234746232e03f58bfa384ff3a8d6bcc7bba7e1bb12a8f49d563b81b"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "a2a1ee3be6b23d51c86988ba42b307f60c80a15f4aac6b5d6adf46ef421f3519"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "9e69770f5d70979f6574ef466e5a39022f8ced73b6376913501d44f8d82f7454"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@28.1.0"
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
