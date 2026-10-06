# Legacy release, converted from Formula/xiond@17.0.1.rb. Frozen: do not edit.
cask "xiond@17.0.1" do
  version "17.0.1"

  on_macos do
    on_arm do
      sha256 "7d3f157d6ae511ec0a1817d99c7aa0bd6c150c1290e2935fa3732d182ad76df0"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "5fba931b3ce5933d4a855a73d8a1c592697722c5d16b6d2df0cc0adfec6375b7"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "14a75edbb7c79bc13db0ebc682fef883925f64b32bf4771c182015355b2bd2f4"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "edbbece5edf27115777cfe871abacc9f43e0b6be5d2784253fd16d6dd802708d"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@17.0.1"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
