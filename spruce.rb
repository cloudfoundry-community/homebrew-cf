require "fileutils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.35.11" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
  version v
  sha256 "a45d5218238d87586a7ba1dad5823c169b81f6564c4b83d3bd27df325507bae7" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
