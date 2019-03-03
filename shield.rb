require "FileUtils"

class Shield < Formula
  homepage "https://github.com/starkandwayne/shield"

  v = "v8.0.19" # CI Managed
  url "https://github.com/starkandwayne/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "4676ef2da8b65aad1d092fcd4cb0fe7f04cce7eb96f815e5d95d657e68045140" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

