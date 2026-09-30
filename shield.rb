require "fileutils"

class Shield < Formula
  homepage "https://github.com/shieldproject/shield"

  v = "v9.0.2" # CI Managed
  version v

  if Hardware::CPU.arm?
    url "https://github.com/shieldproject/shield/releases/download/#{v}/shield-darwin-arm64"
    sha256 "122666ee046d7f88984ff690389cd067e62478c5445a37a5e85558b62349f873" # CI Managed arm64
  else
    url "https://github.com/shieldproject/shield/releases/download/#{v}/shield-darwin-amd64"
    sha256 "f962e8805bf99dfb8a46ab18dd634d8ed671e0d442c0b1e2712821bba440318a" # CI Managed
  end

  def install
    FileUtils.mv(Dir["shield-darwin-*"].first, "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

