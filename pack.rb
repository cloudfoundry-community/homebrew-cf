require "FileUtils"

class Pack < Formula
  homepage "https://github.com/buildpack/pack"

  v = "v0.0.7" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/buildpack/pack/releases/download/#{v}/pack-#{@@verNum}-macos.tar.gz"
  version v
  sha256 "0babffe1971867149b5c698eaedefc38072ee445c90b888edd9b7de7dfa07fed" # CI Managed

  def install
    bin.install "pack"
  end
end
