require "FileUtils"

class Eden < Formula
  homepage "https://github.com/starkandwayne/eden"

  v = "v0.6.4" # CI Managed
  url "https://github.com/starkandwayne/eden/releases/download/#{v}/eden-darwin-amd64"
  version v
  sha256 "377f17922bebc9a1b907c4002a66cee5d2ff444a9bd19ee5e17147bffe0436ef" # CI Managed

  def install
    FileUtils.mv("eden-darwin-amd64", "eden")
    bin.install "eden"
  end

  test do
    system "#{bin}/eden", "--version"
  end
end
