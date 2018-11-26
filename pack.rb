require "FileUtils"

class Pack < Formula
  homepage "https://github.com/buildpack/pack"

  v = "v0.0.6" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/buildpack/pack/releases/download/#{v}/pack-#{@@verNum}-macos.tar.gz"
  version v
  sha256 "505176065fd2afcf173452335245c6beeebe27ddb69433f33c9b3bcbaed1e458" # CI Managed

  def install
    bin.install "pack"
  end
end
