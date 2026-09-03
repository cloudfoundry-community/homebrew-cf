require "fileutils"

class Shield < Formula
  homepage "https://github.com/shieldproject/shield"

  v = "v9.0.2" # CI Managed
  url "https://github.com/shieldproject/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "f962e8805bf99dfb8a46ab18dd634d8ed671e0d442c0b1e2712821bba440318a" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

