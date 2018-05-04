require "FileUtils"

class Shield < Formula
  homepage "https://github.com/starkandwayne/shield"

  v = "v8.0.9" # CI Managed
  url "https://github.com/starkandwayne/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "229bf1186fcaa1c0a6b45130a0ff3d331011cd27a130040b92f6e305aff616c6" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

