require "FileUtils"

class Gotcha < Formula
  homepage "https://github.com/starkandwayne/gotcha"

  v = "v0.2.0" # CI Managed
  url "https://github.com/starkandwayne/gotcha/releases/download/#{v}/gotcha-darwin-amd64"
  version v
  sha256 "41da14a6dd1a38a0aeba09a7c158f1baac7ecbffff3831de71b6f779f734e77a" # CI Managed

  def install
    FileUtils.mv("gotcha-darwin-amd64", "gotcha")
    bin.install "gotcha"
  end

  test do
    system "#{bin}/gotcha", "-h"
  end
end

