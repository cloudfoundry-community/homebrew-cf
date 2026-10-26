require "fileutils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.35.24" # CI Managed
  version v

  if Hardware::CPU.arm?
    url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-arm64"
    sha256 "9fb908fcd2059bc613180cea9bd1a82df931cb65574bcd6e74d4aad13c730d73" # CI Managed arm64
  else
    url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
    sha256 "b2ca799f3cc9baa56679af9fc8a1f7176b583ae7f00541cdc9bd9fe540ae418a" # CI Managed
  end

  def install
    FileUtils.mv(Dir["spruce-darwin-*"].first, "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
