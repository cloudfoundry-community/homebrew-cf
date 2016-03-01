require "FileUtils"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"

  version = "v1.1.0" # CI Managed
  url "https://github.com/geofffranks/spruce/releases/download/#{version}/spruce-darwin-amd64"
  sha256 "1d9f13f2a0b6c130d295e1ab2fac3be972078967fe6086b0e0427eec552c6cdb" # CI Managed

  def install
    FileUtils.mv("spruce-darwin-amd64", "spruce")
    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
