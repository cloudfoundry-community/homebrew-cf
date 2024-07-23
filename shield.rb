require "fileutils"

class Shield < Formula
  homepage "https://github.com/starkandwayne/shield"

  v = "v8.8.7" # CI Managed
  url "https://github.com/starkandwayne/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "3333aae48c583630fd070f4683fd3ac3704d93229e3d76f66d6d58ae4228edde" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

