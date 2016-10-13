require "FileUtils"

class Bosh2 < Formula
  homepage "https://github.com/cloudfoundry/bosh-cli"

  v = "v0.0.70" # CI Managed
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{v}-darwin-amd64"
  version v
  sha256 "" # CI Managed

  def install
    verNum = v.sub "v", ""
    FileUtils.mv("bosh-cli-#{verNum}-darwin-amd64", "bosh2")
    bin.install "bosh2"
  end

  test do
    system "#{bin}/bosh2", "--version"
  end
end
