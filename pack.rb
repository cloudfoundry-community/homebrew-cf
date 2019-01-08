require "FileUtils"

class Pack < Formula
  homepage "https://github.com/buildpack/pack"

  v = "v0.0.9" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/buildpack/pack/releases/download/#{v}/pack-#{@@verNum}-macos.tar.gz"
  version v
  sha256 "6b8ed842d91ddff35f6aa96fefc4ecde767a4ee7a3bdc772eba0a14c123cd47b" # CI Managed

  def install
    bin.install "pack"
  end
end
