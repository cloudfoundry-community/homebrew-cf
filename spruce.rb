require "FileUtils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.8.4" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
  version v
  sha256 "e4c45e5e1562faa6762c30aceec04478993977ad603edb3c26b41be05ecdae77" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
