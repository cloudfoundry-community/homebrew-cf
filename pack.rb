require "FileUtils"

class Pack < Formula
  homepage "https://github.com/buildpack/pack"

  v = "v0.0.8" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/buildpack/pack/releases/download/#{v}/pack-#{@@verNum}-macos.tar.gz"
  version v
  sha256 "806811d821288ead43f14b83a4e3aa8908b22d3ee06cbd9d9691bd6412d7d880" # CI Managed

  def install
    bin.install "pack"
  end
end
