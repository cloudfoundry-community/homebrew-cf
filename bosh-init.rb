require "FileUtils"

class BoshInit < Formula
  homepage "https://github.com/cloudfoundry/bosh-init"

  v = "v0.0.99" # CI Managed
  # remove v from version number
  @@verNum = v.sub "v", "" 
  url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-#{@@verNum}-darwin-amd64"
  version v
  sha256 "" # CI Managed

  def install
    FileUtils.mv("bosh-init-#{@@verNum}-darwin-amd64", "bosh-init")
    bin.install "bosh-init"
  end

  test do
    system "#{bin}/bosh-init", "--version"
  end
end
