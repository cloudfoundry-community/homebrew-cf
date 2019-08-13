require "fileutils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  v = "v1.22.0" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{v}/spruce-darwin-amd64"
  version v
  sha256 "31412e01c8ef86a0ca2209b442584019e7afeba8a6ea39d8f308f003cf653978" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
