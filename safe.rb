require "fileutils"

class Safe < Formula
  homepage "https://github.com/starkandwayne/safe"

  v = "v1.5.9" # CI Managed
  url "https://github.com/starkandwayne/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "6880f6f3c72bee2b2d486e05ff6187b5cd0f82ca7facb282809757743685c5cb" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
