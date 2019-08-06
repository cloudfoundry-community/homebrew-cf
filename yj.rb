require "fileutils"

class Yj < Formula
  homepage "https://github.com/sclevine/yj"

  v = "v4.0.0" # CI Managed
  url "https://github.com/sclevine/yj/releases/download/#{v}/yj-macos"
  version v
  sha256 "cd8e3aecfa8a8ace509f3aee6ca707b25a096d542b5634c028232d6caca31c75" # CI Managed

  def install
    FileUtils.mv("yj-macos", "yj")
    bin.install "yj"
  end

  test do
    system "#{bin}/yj", "-h"
  end
end
