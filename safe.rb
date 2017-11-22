require "FileUtils"

class Safe < Formula
  homepage "https://github.com/starkandwayne/safe"

  v = "v0.5.1" # CI Managed
  url "https://github.com/starkandwayne/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "8ce6e107623e14dc8120b6b891c8c70fcd0f2bbf0846105191753ece364b003d" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
