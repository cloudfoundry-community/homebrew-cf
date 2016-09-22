require "FileUtils"

class Gotcha < Formula
  homepage "https://github.com/starkandwayne/gotcha"

  v = "v1.1.2" # CI Managed
  url "https://github.com/starkandwayne/gotcha/releases/download/#{v}/gotcha-darwin-amd64"
  version v
  sha256 "494a1c00aa112b571e948313530ad74a40e150ab82fafd9891ff1bcc9bf9be81" # CI Managed

  def install
    FileUtils.mv("gotcha-darwin-amd64", "gotcha")
    bin.install "gotcha"
  end

  test do
    system "#{bin}/gotcha", "-h"
  end
end

