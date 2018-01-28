require "FileUtils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.15.1" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
  version v
  sha256 "25e19a781fabc0319abed8d1b265000063bd407ddc9ae342b61d11d252d3bf38" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
