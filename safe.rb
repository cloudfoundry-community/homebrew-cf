require "FileUtils"

class Safe < Formula
  homepage "https://github.com/jhunt/safe"

  v = "v0.0.20" # CI Managed
  url "https://github.com/jhunt/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "913fe5e3605c0665d7a080536a15bdd8ac92f156ae3775e4637e7e077e1ec0b7" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
