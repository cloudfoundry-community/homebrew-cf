require "fileutils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.35.25" # CI Managed
  version v

  if Hardware::CPU.arm?
    url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-arm64"
    sha256 "d5f8e18108dd4c08a7d271a5f716ded24d7dbc20517c1df2c6d1f95477955b73" # CI Managed arm64
  else
    url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
    sha256 "34bb09e9a7b38869b0447ee1a21cf321893919afb98360772e9e2b798a14dfff" # CI Managed
  end

  def install
    FileUtils.mv(Dir["spruce-darwin-*"].first, "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
