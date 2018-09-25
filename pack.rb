require "FileUtils"

class Pack < Formula
  homepage "https://github.com/buildpack/pack"

  v = "v0.0.3" # CI Managed
  url "https://github.com/buildpack/pack/releases/download/#{v}/pack-macos"
  version v
  sha256 "b5708539e459c03707ac2ade19590d27e5b7d26dc7144724af1442ace7786d07" # CI Managed

  def install
    FileUtils.mv("pack-macos", "pack")
    bin.install "pack"
  end
end
