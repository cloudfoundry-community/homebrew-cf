require "FileUtils"

class Pack < Formula
  homepage "https://github.com/buildpack/pack"

  v = "v0.2.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/buildpack/pack/releases/download/#{v}/pack-#{@@verNum}-macos.tar.gz"
  version v
  sha256 "" # CI Managed

  def install
    bin.install "pack"
  end
end
