require "fileutils"

class Shield < Formula
  homepage "https://github.com/starkandwayne/shield"

  v = "v8.4.0" # CI Managed
  url "https://github.com/starkandwayne/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "f5d79acab72f052f0564c8bd3954e314f4fc3177a7aee52d5ac11ef8e8f8ff78" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

