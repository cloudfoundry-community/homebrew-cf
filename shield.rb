require "FileUtils"

class Shield < Formula
  homepage "https://github.com/starkandwayne/shield"

  v = "v8.1.0" # CI Managed
  url "https://github.com/starkandwayne/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "a1ddf93a53ce5947879bfba4e0513faf4064bf3586f4ddf4ab4afaa48c4a0bfa" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

