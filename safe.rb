require "fileutils"

class Safe < Formula
  homepage "https://github.com/starkandwayne/safe"

  v = "v1.8.0" # CI Managed
  url "https://github.com/starkandwayne/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "847571b0c4d65f13249afdc45ac7d572fd6b3a24883aa6577acd9327099597b3" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
