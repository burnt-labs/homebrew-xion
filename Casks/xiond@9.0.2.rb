# Legacy release, converted from Formula/xiond@9.0.2.rb. Frozen: do not edit.
cask "xiond@9.0.2" do
  version "9.0.2"

  on_macos do
    on_arm do
      sha256 "e7bc92fa7cb0bdc2fee3b9ca682c03d4a5294702aac7c10978fb8c7b8631f4de"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "8b9bfd45f5f9d05e1bc53a46a658b0b194fbe3de8d63186ca3aa008c20ad5fd0"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "28bb191caba1d5ee4695be28ec2bfe8934bb1cc5a5575090b5af54d0d2cb5f14"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "27be3efe7cb6c46a9f8383c31ae85704eb5bf01d39900886f3e5dc4eaa633361"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@9.0.2"
  desc "Xiond is the Cosmos SDK based blockchain cli/daemon for the Xion Network."
  homepage "https://xion.burnt.com/"

  livecheck do
    skip "Legacy release."
  end

  binary "xiond"

  # No zap stanza required
end
