require "fileutils"

class Shield < Formula
  homepage "https://github.com/starkandwayne/shield"

  v = "v8.8.3" # CI Managed
  url "https://github.com/starkandwayne/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "75119148dcd6468702abd1921ee075d3f8383d17f4cf0a4392fc026002806f79" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

