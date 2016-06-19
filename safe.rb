require "FileUtils"

class Safe < Formula
  homepage "https://github.com/jhunt/safe"

  v = "v0.0.16" # CI Managed
  url "https://github.com/jhunt/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "faaef31a55d641cb54ea8da447acbcec86d7d74e024f9244b51731afa580b90f" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
