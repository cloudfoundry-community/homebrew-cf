require "FileUtils"

class Safe < Formula
  homepage "https://github.com/starkandwayne/safe"

  v = "v0.2.2" # CI Managed
  url "https://github.com/starkandwayne/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "6ec9d45c9fdb539816cdb28a444c7b33fa7194589a88a6444b4abb000ded7dc3" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
