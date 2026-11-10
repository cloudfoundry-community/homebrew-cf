require "fileutils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.35.26" # CI Managed
  version v

  if Hardware::CPU.arm?
    url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-arm64"
    sha256 "241a20ba54bf4a980f3ebe2676ddd70b4c71484730c0d9075fdf2cf84562560d" # CI Managed arm64
  else
    url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
    sha256 "b7fc669c9b9ddb9d7b1eac16be0278f7b79802b7c12a446aca1b6fafe2a1f13c" # CI Managed
  end

  def install
    FileUtils.mv(Dir["spruce-darwin-*"].first, "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
