# Legacy release, converted from Formula/xiond@12.0.0.rb. Frozen: do not edit.
cask "xiond@12.0.0" do
  version "12.0.0"

  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  on_macos do
    on_arm do
      sha256 "babcae4b7e10bbdf019632ab0d5820149566adb66bbab122119b05560c85fd59"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-arm64"
    end
    on_intel do
      sha256 "acb0c58abd1466353b909af7fe83d321a533e0f1407a8d4cffd69909ee558278"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-darwin-amd64"
    end
  end
  on_linux do
    on_arm do
      sha256 "c6f48600df450713874c0de05a94c2fbba0d4ffc8bcc725440187d7dc329cecc"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-arm64"
    end
    on_intel do
      sha256 "b9c87313fe12c89648e1fefe929e771e98af25222306f9c736bf29750c12e436"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond-linux-amd64"
    end
  end

  name "xiond@12.0.0"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  # This release shipped bare binaries named per platform, not archives.
  binary "xiond-#{os}-#{arch}", target: "xiond"

  # No zap stanza required
end
