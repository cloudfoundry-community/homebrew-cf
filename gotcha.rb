require "FileUtils"

class Gotcha < Formula
  homepage "https://github.com/starkandwayne/gotcha"

  v = "v0.1.0" # CI Managed
  url "https://github.com/starkandwayne/gotcha/releases/download/#{v}/gotcha-darwin-amd64"
  version v
  sha256 "6baf9b87b0a5d42d6be31ce82dccf56161a036fa10b4bfbe911b846a9e8f6620" # CI Managed

  def install
    FileUtils.mv("gotcha-darwin-amd64", "gotcha")
    bin.install "gotcha"
  end

  test do
    system "#{bin}/gotcha", "-h"
  end
end

