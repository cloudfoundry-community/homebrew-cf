require "fileutils"

class Yj < Formula
  homepage "https://github.com/sclevine/yj"

  v = "v5.1.0" # CI Managed
  url "https://github.com/sclevine/yj/releases/download/#{v}/yj-macos"
  version v
  sha256 "" # CI Managed

  def install
    FileUtils.mv("yj-macos", "yj")
    bin.install "yj"
  end

  test do
    system "#{bin}/yj", "-h"
  end
end
