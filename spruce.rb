require "FileUtils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.19.1" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
  version v
  sha256 "3e223804c97fe4e3f8b33a049b94d2f2f80e18e1773dfd6b1c837cc7fd8870ee" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
