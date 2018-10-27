require "FileUtils"

class Pack < Formula
  homepage "https://github.com/buildpack/pack"

  v = "v0.0.5" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/buildpack/pack/releases/download/#{v}/pack-#{@@verNum}-macos.tar.gz"
  version v
  sha256 "23d647e7cec08d0452ea6d5325e09538d22683b227cb502690bd435758d4a657" # CI Managed

  def install
    bin.install "pack"
  end
end
