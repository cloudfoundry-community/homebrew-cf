require "FileUtils"

class Safe < Formula
  homepage "https://github.com/jhunt/safe"

  v = "v0.0.10" # CI Managed
  url "https://github.com/jhunt/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "22b7c6901a531e5f2cd11f5e97507b2ce89163d32cabfeca308d1aea7561" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
