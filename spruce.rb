require "fileutils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.35.20" # CI Managed
  version v

  if Hardware::CPU.arm?
    url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-arm64"
    sha256 "c1917444c86542fe139701074dab51a76a7d20e4a87dc14919facca1c016e57c" # CI Managed arm64
  else
    url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
    sha256 "5680ce84bfe04ef53e1daac0b28f158eecc219f4b14605246dca0b4d88fbfe20" # CI Managed
  end

  def install
    FileUtils.mv(Dir["spruce-darwin-*"].first, "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
