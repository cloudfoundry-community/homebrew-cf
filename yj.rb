require "fileutils"

class Yj < Formula
  homepage "https://github.com/sclevine/yj"

  v = "v5.0.0" # CI Managed
  url "https://github.com/sclevine/yj/releases/download/#{v}/yj-macos"
  version v
  sha256 "cf9b691856f2add8a6efeb1c099da1d9411f42a745ef81c8386c9df5c1f57c65" # CI Managed

  def install
    FileUtils.mv("yj-macos", "yj")
    bin.install "yj"
  end

  test do
    system "#{bin}/yj", "-h"
  end
end
