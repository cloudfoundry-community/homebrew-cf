require "FileUtils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  version = "v1.1.0" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{version}/spruce-darwin-amd64"
  sha256 "8ea821ae0a408ccba4c1a058f528031c0b0b236cb96c837237d2bf7862064591" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
