require "FileUtils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.19.0" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
  version v
  sha256 "48459cea0194b1fe07344b983d29adf45b8e254db8a761c3120a7703b9b60060" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
