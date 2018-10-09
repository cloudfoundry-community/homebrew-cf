require "FileUtils"

class Pack < Formula
  homepage "https://github.com/buildpack/pack"

  v = "v0.0.4" # CI Managed
  url "https://github.com/buildpack/pack/releases/download/#{v}/pack-macos.tar.gz"
  version v
  sha256 "a0287f5d848dc6b9014bd5ac0576e811b90f8f32d6d672bf91b142cad4e530a8" # CI Managed

  def install
    FileUtils.mv("pack-macos", "pack")
    bin.install "pack"
  end
end
