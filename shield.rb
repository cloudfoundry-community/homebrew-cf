require "fileutils"

class Shield < Formula
  homepage "https://github.com/starkandwayne/shield"

  v = "v8.8.6" # CI Managed
  url "https://github.com/starkandwayne/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "dde3c4c97dbad418c3c842e359e9e7ae6df58102f1b200ff207b4aa70345ab31" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

