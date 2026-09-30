require "fileutils"

class Yj < Formula
  homepage "https://github.com/sclevine/yj"

  v = "v5.1.0" # CI Managed
  version v

  if Hardware::CPU.arm?
    url "https://github.com/sclevine/yj/releases/download/#{v}/yj-macos-arm64"
    sha256 "c8185c694884a01e8aa8f6f5a4b3d34993bd65c3f019de64cf0ea743d1fd038a" # CI Managed arm64
  else
    url "https://github.com/sclevine/yj/releases/download/#{v}/yj-macos-amd64"
    sha256 "261eedd7fd497930ef4d6793c0f11e8375896ed5f96449b9cdc1506b1c249343" # CI Managed
  end

  def install
    FileUtils.mv(Dir["yj-macos-*"].first, "yj")
    bin.install "yj"
  end

  test do
    system "#{bin}/yj", "-h"
  end
end
