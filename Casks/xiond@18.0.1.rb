# Legacy release, converted from Formula/xiond@18.0.1.rb. Frozen: do not edit.
cask "xiond@18.0.1" do
  version "18.0.1"

  on_macos do
    on_arm do
      sha256 "ea073b1d58c1a226df34b69be6c98800d3a8cd9a97771ebc1d45fdce8d96cf5c"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "e1d0bde096c0bd560d816e09d615fc281cce9d6f504420990672c01288d75a02"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "b48a77972e23a459b7d1ac48e2315e3646332c4d520a8ca0364ba7c3d4aef8f2"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "2f8b93ad016b8960234fd2fc3eb365b212517c59c19edb1ff5d964d3d5588e26"
      url "https://github.com/burnt-labs/xion/releases/download/v#{version}/xiond_#{version}_linux_amd64.tar.gz"
    end
  end

  name "xiond@18.0.1"
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
