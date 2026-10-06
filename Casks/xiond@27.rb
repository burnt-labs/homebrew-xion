# Legacy release, converted from Formula/xiond@27.rb. Frozen: do not edit.
cask "xiond@27" do
  version "27.0.0-rc2"

  on_macos do
    on_arm do
      sha256 "126142075c21bd98a7f2599b30ff42620d10743f09957538422992b9551baeec"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "4d7baaafa1497cd7cebf4d89e5404aa0db7bd6e190cc41a7349e97c2efda9abf"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "336705c16d327aa34df4e5a60f9f9d9c74ff40a997fa8087ca97d438b4934537"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "157f0afa84c73247373f97047debe24cb768181dc8214d4da16204662e715ffe"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@27"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
