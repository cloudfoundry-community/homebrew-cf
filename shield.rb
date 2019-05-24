require "FileUtils"

class Shield < Formula
  homepage "https://github.com/starkandwayne/shield"

  v = "v8.2.1" # CI Managed
  url "https://github.com/starkandwayne/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "18f6f9fae64804179cdd4bb0fc538074f15d26e46102de3b726a57637ca9ff19" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

