require "FileUtils"

class Bosh2 < Formula
  homepage "https://github.com/cloudfoundry/bosh-cli"

  v = "v0.0.113" # CI Managed
  # remove v from version number
  @@verNum = v.sub "v", "4586b76ddeaa3d7e36df02065e49e630c5cdc372f4820e11225e1fda85b14dab" 
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{@@verNum}-darwin-amd64"
  version v
  sha256 "" # CI Managed

  def install
    FileUtils.mv("bosh-cli-#{@@verNum}-darwin-amd64", "bosh2")
    bin.install "bosh2"
  end

  test do
    system "#{bin}/bosh2", "--version"
  end
end
