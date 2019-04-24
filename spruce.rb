require "FileUtils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.20.0" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
  version v
  sha256 "236a191650c3972b3be3056e76c88850b4373400d127763c165b5a387605cbb0" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
