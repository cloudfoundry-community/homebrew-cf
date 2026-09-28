require "fileutils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.35.20" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
  version v
  sha256 "5680ce84bfe04ef53e1daac0b28f158eecc219f4b14605246dca0b4d88fbfe20" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
