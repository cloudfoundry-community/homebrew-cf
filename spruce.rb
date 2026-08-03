require "fileutils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.35.15" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
  version v
  sha256 "9bea30493a4a34286e9f52d4b04583edad0d8c284b6a7c4d866de3594dc39a86" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
